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

use crate::{dbus_client, util::RGBA};

mod generic_mouse;
mod null_mouse;
mod roccat_burst_pro;
mod roccat_kone_pure_ultra;

pub type Result<T> = std::result::Result<T, eyre::Error>;

// #[derive(Debug, thiserror::Error)]
// pub enum HwDevicesError {
//     #[error("The device is not supported")]
//     UnsupportedDevice,
// }

pub fn get_mouse_device() -> Result<Box<dyn Mouse>> {
    match dbus_client::get_managed_devices()?.1.get(0) {
        Some(device) => match device {
            // ROCCAT Kone Pure Ultra
            (0x1e7d, 0x2dd2) => Ok(Box::new(roccat_kone_pure_ultra::RoccatKonePureUltra::new())),

            // ROCCAT Burst Pro
            (0x1e7d, 0x2de1) => Ok(Box::new(roccat_burst_pro::RoccatBurstPro::new())),

            _ => Ok(Box::new(generic_mouse::GenericMouse::new())),
        },

        None => Ok(Box::new(null_mouse::NullMouse::new())),
    }
}

pub struct Rectangle {
    x: f64,
    y: f64,
    width: f64,
    height: f64,
}

pub trait Mouse {
    fn get_make_and_model(&self) -> (&'static str, &'static str);

    /// Draw an animated mouse with live action colors
    fn draw_mouse(&self, _da: &gtk::DrawingArea, context: &cairo::Context) -> Result<()>;

    /// Paint a cell on the Mouse widget
    fn paint_cell(
        &self,
        cell_index: usize,
        color: &RGBA,
        cr: &cairo::Context,
        width: f64,
        height: f64,
        scale_factor: f64,
    );
}
