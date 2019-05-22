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

use log::*;
use procinfo;
use rlua;
use rlua::Context;
use std::any::Any;
use std::cell::RefCell;
use std::error;
use std::error::Error;
use std::fmt;
use std::fs::File;

use crate::plugins::Plugin;
use crate::util;

pub type Result<T> = std::result::Result<T, SystemPluginError>;

#[derive(Debug, Clone)]
pub struct SystemPluginError {
    code: u32,
}

impl error::Error for SystemPluginError {
    fn description(&self) -> &str {
        match self.code {
            0 => "",
            _ => "Unknown error",
        }
    }

    fn cause(&self) -> Option<&dyn error::Error> {
        None
    }
}

impl fmt::Display for SystemPluginError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{}", self.description())
    }
}

pub struct SystemPlugin {}

impl SystemPlugin {
    pub fn new() -> Self {
        SystemPlugin {}
    }

    pub fn get_current_load_avg_1() -> f32 {
        procinfo::loadavg().unwrap().load_avg_1_min
    }

    pub fn get_current_load_avg_5() -> f32 {
        procinfo::loadavg().unwrap().load_avg_5_min
    }

    pub fn get_current_load_avg_10() -> f32 {
        procinfo::loadavg().unwrap().load_avg_10_min
    }

    pub fn get_runnable_tasks() -> u32 {
        procinfo::loadavg().unwrap().tasks_runnable
    }

    pub fn get_total_tasks() -> u32 {
        procinfo::loadavg().unwrap().tasks_total
    }
}

impl Plugin for SystemPlugin {
    fn get_name(&self) -> String {
        "System".to_string()
    }

    fn get_description(&self) -> String {
        "Basic system information and status".to_string()
    }

    fn initialize(&mut self) {}

    fn register_lua_funcs(&self, lua_ctx: Context) -> rlua::Result<()> {
        let globals = lua_ctx.globals();

        let get_current_load_avg_1 =
            lua_ctx.create_function(|_, ()| Ok(SystemPlugin::get_current_load_avg_1()))?;
        globals.set("get_current_load_avg_1", get_current_load_avg_1)?;

        let get_current_load_avg_5 =
            lua_ctx.create_function(|_, ()| Ok(SystemPlugin::get_current_load_avg_5()))?;
        globals.set("get_current_load_avg_5", get_current_load_avg_5)?;

        let get_current_load_avg_10 =
            lua_ctx.create_function(|_, ()| Ok(SystemPlugin::get_current_load_avg_10()))?;
        globals.set("get_current_load_avg_10", get_current_load_avg_10)?;

        let get_runnable_tasks =
            lua_ctx.create_function(|_, ()| Ok(SystemPlugin::get_runnable_tasks()))?;
        globals.set("get_runnable_tasks", get_runnable_tasks)?;

        let get_total_tasks =
            lua_ctx.create_function(|_, ()| Ok(SystemPlugin::get_total_tasks()))?;
        globals.set("get_total_tasks", get_total_tasks)?;

        Ok(())
    }

    fn main_loop_hook(&self, ticks: u64) {}

    fn as_any(&self) -> &Any {
        self
    }

    fn as_any_mut(&mut self) -> &mut Any {
        self
    }
}
