/*
    This file is part of Eruption.

    Eruption is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Eruption is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Eruption.  If not, see <http://www.gnu.org/licenses/>.
*/

#![feature(clamp)]

use clap::{App, Arg};
use lazy_static::lazy_static;
use log::*;
use pretty_env_logger;
use std::convert::TryInto;
use std::env;
use std::error::Error;
use std::path::PathBuf;
use std::process;
use std::sync::atomic::{AtomicBool, Ordering};
use std::sync::mpsc::channel;
use std::sync::Arc;
use std::thread;
use std::time::{Duration, Instant};
use std::u64;

mod util;

use hidapi;

mod rvdevice;
use rvdevice::RvDeviceState;

mod constants;
mod plugin_manager;
mod plugins;
mod scripting;

lazy_static! {
    pub static ref QUIT: Arc<AtomicBool> = Arc::new(AtomicBool::new(false));
}

fn print_header() {
    println!(
        r#"
 Eruption is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 Eruption is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with Eruption.  If not, see <http://www.gnu.org/licenses/>.
"#
    );
}

/// Process commandline options
fn parse_commandline<'a>() -> clap::ArgMatches<'a> {
    App::new("Eruption")
        .version("0.0.3")
        .author("X3n0m0rph59 <x3n0m0rph59@gmail.com>")
        .about("Linux user-mode driver for the ROCCAT Vulcan 100/12x series keyboards")
        .arg(
            Arg::with_name("config")
                .short("c")
                .long("config")
                .value_name("FILE")
                .help("Specify a custom config file")
                .takes_value(true),
        )
        .arg(
            Arg::with_name("script")
                .help("Specify the Lua script to execute")
                .required(true)
                .index(1),
        )
        .arg(
            Arg::with_name("v")
                .short("v")
                .multiple(true)
                .help("Sets the level of verbosity"),
        )
        .get_matches()
}

/// Main program entrypoint
fn main() {
    print_header();

    let matches = parse_commandline();

    let config = matches.value_of("config").unwrap_or("eruption.conf");
    let script = matches.value_of("script").unwrap();
    let verbosity = matches.occurrences_of("v");

    // initialize logging
    if env::var("RUST_LOG").is_err() {
        env::set_var("RUST_LOG_OVERRIDE", "info");
        pretty_env_logger::init_custom_env("RUST_LOG_OVERRIDE");
    } else {
        pretty_env_logger::init();
    }

    info!("Starting user-mode driver for ROCCAT Vulcan 100/12x series devices");

    // register ctrl-c handler
    let q = QUIT.clone();
    ctrlc::set_handler(move || {
        q.store(true, Ordering::SeqCst);
    })
    .unwrap_or_else(|e| error!("Could not set CTRL-C handler: {}", e));

    // create the one and only hidapi instance
    match hidapi::HidApi::new() {
        Ok(hidapi) => match RvDeviceState::enumerate_devices(&hidapi) {
            Ok(mut rvdevice) => {
                // open the control and led device
                info!("Opening devices...");
                rvdevice
                    .open(&hidapi)
                    .unwrap_or_else(|e| error!("{}", e.description()));

                // send initialization handshake
                info!("Initializing devices...");
                rvdevice.send_init_sequence().unwrap_or_else(|e| {
                    error!("Could not initialize the device: {}", e.description())
                });

                // set leds to a known initial state
                info!("Configuring LEDs...");
                rvdevice
                    .set_led_init_pattern()
                    .unwrap_or_else(|e| error!("Could not initialize LEDs: {}", e.description()));

                // initialize plugins
                // info!("Registering plugins...");
                plugins::register_plugins()
                    .unwrap_or_else(|_e| error!("Could not register plugin"));

                // spawn a thread for the Lua VM, and then load and execute a script
                info!("Loading Lua scripts...");
                let (lua_tx, lua_rx) = channel();

                let script_path = PathBuf::from(script.to_string());
                thread::spawn(move || {
                    scripting::run_script(&script_path, rvdevice, &lua_rx)
                        .unwrap_or_else(|e| error!("Could not load script: {}", e));
                });

                // spawn a thread to handle keyboard input
                info!("Spawning input thread...");
                let (kbd_tx, kbd_rx) = channel();
                thread::spawn(move || {
                    {
                        // initialize thread local state of the keyboard plugin
                        let mut plugin_manager = plugin_manager::PLUGIN_MANAGER.write().unwrap();
                        let keyboard_plugin = plugin_manager
                            .find_plugin_by_name_mut("Keyboard".to_string())
                            .as_any_mut()
                            .downcast_mut::<plugins::KeyboardPlugin>()
                            .unwrap();

                        keyboard_plugin.initialize_thread_locals();
                    }

                    loop {
                        let plugin_manager = plugin_manager::PLUGIN_MANAGER.read().unwrap();
                        let keyboard_plugin = plugin_manager
                            .find_plugin_by_name("Keyboard".to_string())
                            .as_any()
                            .downcast_ref::<plugins::KeyboardPlugin>()
                            .unwrap();

                        if let Ok(event) = keyboard_plugin.get_next_event() {
                            kbd_tx.send(event).unwrap();
                        } else {
                            // ignore spurious events
                            // error!("Could not get next keyboard event");
                        }
                    }
                });

                lua_tx.send(scripting::Message::Startup).unwrap();

                // trace!("Entering main loop...");

                // main loop iterations, monotonic counter
                let mut ticks = 0;

                // used to calculate frames per second
                let mut fps_cntr = 0;
                let mut fps_timer = Instant::now();

                let mut start_time = Instant::now();

                // enter the main loop on the main thread
                'MAIN_LOOP: loop {
                    // prepare to call main loop hook
                    let plugin_manager = plugin_manager::PLUGIN_MANAGER.read().unwrap();
                    let plugins = plugin_manager.get_plugins();

                    // call main loop hook of each registered plugin
                    for plugin in plugins.iter() {
                        plugin.main_loop_hook(ticks);
                    }

                    // send timer tick event to the Lua VM
                    lua_tx
                        .send(scripting::Message::Tick(
                            start_time.elapsed().as_millis().try_into().unwrap(),
                        ))
                        .unwrap();

                    // send pending keyboard events
                    match kbd_rx.recv_timeout(Duration::from_millis(0)) {
                        Ok(index) => lua_tx.send(scripting::Message::KeyDown(index)).unwrap(),

                        // ignore timeout errors
                        Err(std::sync::mpsc::RecvTimeoutError::Timeout) => (),

                        Err(e) => error!("{}", e.description()),
                    }

                    // sync to MAIN_LOOP_DELAY_MILLIS iteration time
                    let elapsed: u64 = start_time.elapsed().as_millis().try_into().unwrap();
                    let sleep_millis = u64::max(
                        constants::MAIN_LOOP_DELAY_MILLIS
                            .checked_sub(elapsed)
                            .unwrap_or(0),
                        constants::MAIN_LOOP_DELAY_MILLIS,
                    );
                    thread::sleep(Duration::from_millis(sleep_millis));

                    let elapsed_after_sleep = start_time.elapsed().as_millis();
                    if elapsed_after_sleep != constants::MAIN_LOOP_DELAY_MILLIS.into() {
                        warn!(
                            "Loop took: {} millis, goal: {}",
                            elapsed_after_sleep,
                            constants::MAIN_LOOP_DELAY_MILLIS
                        );
                    }

                    // calculate and log fps each second
                    if fps_timer.elapsed().as_millis() >= 1000 {
                        trace!("FPS: {}", fps_cntr);

                        fps_timer = Instant::now();
                        fps_cntr = 0;
                    }

                    // shall we quit the main loop?
                    if QUIT.load(Ordering::SeqCst) {
                        break 'MAIN_LOOP;
                    }

                    fps_cntr += 1;
                    ticks += 1;

                    start_time = Instant::now();
                }

                // we left the main loop, send a final message to the running Lua VM
                lua_tx
                    .send(scripting::Message::Quit(0))
                    .unwrap_or_else(|e| error!("Could not send quit message: {}", e.description()));

                // TODO: Ugly hack, find a better way to wait for exit of Lua VM
                thread::sleep(Duration::from_millis(250));
            }

            Err(_) => {
                error!("Could not enumerate system HID devices");
                process::exit(2);
            }
        },

        Err(_) => {
            error!("Could not open HIDAPI");
            process::exit(1);
        }
    }

    info!("Exiting now");
}
