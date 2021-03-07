-- This file is part of Eruption.

-- Eruption is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- Eruption is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with Eruption.  If not, see <http://www.gnu.org/licenses/>.

-- global config
ENABLE_FUNCTION_KEYS = true
ENABLE_MEDIA_KEYS 	 = true
ENABLE_MACRO_KEYS 	 = true

-- HID key codes
GAME_MODE_KEY = 106
EASY_SHIFT_KEY = 21

-- character to key index mapping
key_to_index = {}

key_to_index['GAME_MODE'] = 95

key_to_index['FN'] = 65
key_to_index['CAPS_LOCK'] = 6
key_to_index['LEFT_SHIFT'] = 1
key_to_index['RIGHT_SHIFT'] = 76
key_to_index['LEFT_CTRL'] = 2
key_to_index['RIGHT_CTRL'] = 77
key_to_index['LEFT_ALT'] = 13
key_to_index['RIGHT_ALT'] = 59
key_to_index['RIGHT_MENU'] = 71

key_to_index['ESC'] = 3

key_to_index['F1'] = 14
key_to_index['F2'] = 21
key_to_index['F3'] = 26
key_to_index['F4'] = 31

key_to_index['F5'] = 41
key_to_index['F6'] = 48
key_to_index['F7'] = 54
key_to_index['F8'] = 60

key_to_index['F9'] = 66
key_to_index['F10'] = 72
key_to_index['F11'] = 78
key_to_index['F12'] = 80

key_to_index['INSERT'] = 85
key_to_index['POS1'] = 89
key_to_index['PGUP'] = 94
key_to_index['DEL'] = 86
key_to_index['END'] = 90
key_to_index['PGDWN'] = 95

key_to_index['UP'] = 91
key_to_index['DOWN'] = 92
key_to_index['LEFT'] = 87
key_to_index['RIGHT'] = 96

key_to_index['1'] = 9
key_to_index['2'] = 15
key_to_index['3'] = 22

key_to_index['W'] = 16
key_to_index['A'] = 11
key_to_index['S'] = 17
key_to_index['D'] = 24

-- support functions
function device_specific_key_highlights()
end


-- coordinates to key index mapping
coordinates_to_index = {

	-- ISO model
	0x01, 0x0c, 0x12, 0x18, 0x31, 0x36, 0x3c, 0x42, 0x4f, 0x55, 0x56, 0x67,
	-- TODO: ... complete this ...

	-- TODO: ANSI model
}

keys_per_col = {
	-- TODO: This needs to be verified
	0x06, 0x05, 0x06, 0x06, 0x06, 0x06, 0x07, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x04, 0x04, 0x04, 0x04, 0x04, 0x05, 0x05, 0x03
}

num_keys = get_num_keys()

-- rows
num_rows = 6
max_keys_per_row = 22
rows_topology = {

	-- TODO: This needs to be updated for the Pro model

	-- ISO model
	0x02, 0x0d, 0x14, 0x19, 0x1e, 0x28, 0x2f, 0x35, 0x3b, 0x41, 0x47, 0x4d, 0x4f, 0x5c, 0xff, 0xff, 0xff,
	0x03, 0x08, 0x0e, 0x15, 0x1a, 0x1f, 0x24, 0x29, 0x30, 0x36, 0x3c, 0x42, 0x48, 0x50, 0x54, 0x58, 0x5d,
	0x04, 0x09, 0x0f, 0x16, 0x1b, 0x20, 0x25, 0x2a, 0x31, 0x37, 0x3d, 0x43, 0x49, 0x52, 0x55, 0x59, 0x5e,
	0x05, 0x0a, 0x10, 0x17, 0x1c, 0x21, 0x26, 0x2b, 0x32, 0x38, 0x3e, 0x44, 0x4a, 0xff, 0xff, 0xff, 0xff,
	0x00, 0x06, 0x0b, 0x11, 0x18, 0x1d, 0x22, 0x27, 0x2c, 0x33, 0x39, 0x3f, 0x4b, 0xff, 0x5a, 0xff, 0xff,
    0x01, 0x07, 0x0c, 0x23, 0x3a, 0xff, 0x46, 0x4c, 0x56, 0x5b, 0x5f, 0x40, 0xff, 0xff, 0xff, 0xff, 0xff,

	-- TODO: ANSI model
}

-- columns
num_cols = 16
max_keys_per_col = 6
cols_topology = {
	-- TODO: This needs to be updated for the Pro model

		-- ISO model
	0x02, 0x03, 0x04, 0x05, 0x00, 0x01,
	0x08, 0x09, 0x0a, 0x06, 0x07, 0xff,
	0x0d, 0x0e, 0x0f, 0x10, 0x0b, 0x0c,
	0x14, 0x15, 0x16, 0x17, 0x11, 0xff,
	0x19, 0x1a, 0x1b, 0x1c, 0x18, 0xff,
	0x1e, 0x1f, 0x20, 0x21, 0x1d, 0xff,
	0xff, 0x24, 0x25, 0x26, 0x22, 0x23,
	0x28, 0x29, 0x2a, 0x2b, 0x27, 0xff,
	0x2f, 0x30, 0x31, 0x32, 0x2c, 0xff,
	0x35, 0x36, 0x37, 0x38, 0x33, 0xff,
	0x3b, 0x3c, 0x3d, 0x3e, 0x39, 0x3a,
	0x41, 0x42, 0x43, 0x44, 0x3f, 0xff,
	0x47, 0x48, 0x49, 0x4a, 0x4b, 0x46,
	0x4d, 0x50, 0x52, 0xff, 0x4c, 0xff,
	0x4f, 0x54, 0x55, 0xff, 0xff, 0x56,
	0x5c, 0x58, 0x59, 0xff, 0x5a, 0x5b,
	0xff, 0x5d, 0x5e, 0xff, 0x40, 0x5f,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff,

	-- TODO: ANSI model
}

-- neighbor tables
max_neigh = 10
neighbor_topology = {
	-- TODO: This needs to be updated for the Pro model

	-- ISO model
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x01, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x00, 0x06, 0x07, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x08, 0x03, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x08, 0x04, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x03, 0x08, 0x09, 0x05, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x04, 0x09, 0x0a, 0x06, 0x00, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x05, 0x0a, 0x0b, 0x07, 0x00, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x01, 0x00, 0x06, 0x0b, 0x0c, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x03, 0x04, 0x09, 0x0e, 0x0d, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x04, 0x08, 0x0e, 0x0f, 0x0a, 0x05, 0xff, 0xff, 0xff, 0xff,
	0x05, 0x09, 0x0f, 0x10, 0x06, 0x0b, 0x0b, 0xff, 0xff, 0xff,
	0x06, 0x0a, 0x10, 0x11, 0x0c, 0x07, 0xff, 0xff, 0xff, 0xff,
	0x07, 0x0b, 0x11, 0x23, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x08, 0x0e, 0x15, 0x14, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x08, 0x0d, 0x15, 0x0f, 0x09, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x09, 0x0e, 0x15, 0x16, 0x10, 0x0a, 0xff, 0xff, 0xff, 0xff,
	0x0a, 0x0f, 0x16, 0x17, 0x11, 0x0b, 0xff, 0xff, 0xff, 0xff,
	0x0b, 0x10, 0x17, 0x18, 0x23, 0x0c, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x0d, 0x15, 0x19, 0x0e, 0x1a, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x0e, 0x14, 0x1a, 0x16, 0x0f, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x0f, 0x15, 0x1a, 0x1b, 0x17, 0x10, 0xff, 0xff, 0xff, 0xff,
	0x10, 0x16, 0x1b, 0x1c, 0x18, 0x11, 0xff, 0xff, 0xff, 0xff,
	0x11, 0x17, 0x1c, 0x1d, 0x23, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x14, 0x15, 0x1a, 0x1f, 0x1e, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x15, 0x19, 0x1f, 0x1b, 0x16, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x16, 0x1a, 0x1f, 0x20, 0x1c, 0x17, 0xff, 0xff, 0xff, 0xff,
	0x17, 0x1b, 0x20, 0x21, 0x1d, 0x18, 0xff, 0xff, 0xff, 0xff,
	0x18, 0x1c, 0x21, 0x22, 0x23, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x19, 0x1a, 0x1f, 0x24, 0x28, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x1a, 0x1e, 0x24, 0x20, 0x1b, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x1b, 0x1f, 0x24, 0x25, 0x21, 0x1c, 0xff, 0xff, 0xff, 0xff,
	0x1c, 0x20, 0x25, 0x26, 0x22, 0x1d, 0xff, 0xff, 0xff, 0xff,
	0x1d, 0x21, 0x26, 0x27, 0x23, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x0c, 0x11, 0x18, 0x1d, 0x22, 0x27, 0x2c, 0x33, 0x3a, 0xff,
	0x1e, 0x1f, 0x20, 0x25, 0x29, 0x28, 0xff, 0xff, 0xff, 0xff,
	0x20, 0x24, 0x29, 0x2a, 0x26, 0x21, 0xff, 0xff, 0xff, 0xff,
	0x21, 0x25, 0x2a, 0x2b, 0x27, 0x22, 0xff, 0xff, 0xff, 0xff,
	0x22, 0x26, 0x2b, 0x2c, 0x23, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x1e, 0x24, 0x29, 0x2f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x24, 0x28, 0x2f, 0x30, 0x2a, 0x25, 0xff, 0xff, 0xff, 0xff,
	0x25, 0x29, 0x30, 0x31, 0x2b, 0x26, 0xff, 0xff, 0xff, 0xff,
	0x26, 0x2a, 0x31, 0x32, 0x2c, 0x27, 0xff, 0xff, 0xff, 0xff,
	0x27, 0x2b, 0x32, 0x33, 0x23, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x28, 0x29, 0x30, 0x35, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x29, 0x2f, 0x35, 0x36, 0x31, 0x2a, 0xff, 0xff, 0xff, 0xff,
	0x2a, 0x30, 0x36, 0x37, 0x32, 0x2b, 0xff, 0xff, 0xff, 0xff,
	0x2b, 0x31, 0x37, 0x38, 0x33, 0x2c, 0xff, 0xff, 0xff, 0xff,
	0x2c, 0x32, 0x38, 0x39, 0x3a, 0x23, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x2f, 0x30, 0x36, 0x3b, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x30, 0x35, 0x3b, 0x3c, 0x37, 0x31, 0xff, 0xff, 0xff, 0xff,
	0x31, 0x36, 0x3c, 0x3d, 0x38, 0x32, 0xff, 0xff, 0xff, 0xff,
	0x32, 0x37, 0x3d, 0x3e, 0x39, 0x33, 0xff, 0xff, 0xff, 0xff,
	0x33, 0x38, 0x3e, 0x3f, 0x3a, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x23, 0x33, 0x39, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x35, 0x36, 0x3c, 0x41, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x36, 0x3b, 0x41, 0x42, 0x3d, 0x37, 0xff, 0xff, 0xff, 0xff,
	0x37, 0x3c, 0x42, 0x43, 0x3e, 0x38, 0xff, 0xff, 0xff, 0xff,
	0x38, 0x3d, 0x43, 0x44, 0x3f, 0x39, 0xff, 0xff, 0xff, 0xff,
	0x39, 0x3e, 0x44, 0x4b, 0x3a, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x3a, 0x39, 0x3f, 0x4b, 0x46, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x3b, 0x3c, 0x42, 0x48, 0x47, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x3c, 0x41, 0x48, 0x43, 0x3d, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x3d, 0x42, 0x48, 0x49, 0x44, 0x3e, 0xff, 0xff, 0xff, 0xff,
	0x3e, 0x43, 0x49, 0x4a, 0x4b, 0x3f, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x3f, 0x4b, 0x4c, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x41, 0x42, 0x48, 0x50, 0x4d, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x42, 0x47, 0x50, 0x49, 0x43, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x43, 0x48, 0x50, 0x52, 0x4a, 0x44, 0xff, 0xff, 0xff, 0xff,
	0x44, 0x49, 0x52, 0x4b, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x3f, 0x44, 0x4a, 0x52, 0x4c, 0x46, 0xff, 0xff, 0xff, 0xff,
	0x46, 0x4b, 0x56, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x47, 0x48, 0x50, 0x4f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x4d, 0x50, 0x54, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x48, 0x4d, 0x4f, 0x54, 0x49, 0x52, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x4a, 0x49, 0x50, 0x54, 0x55, 0x4b, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x50, 0x52, 0x55, 0x59, 0x58, 0x4f, 0xff, 0xff, 0xff, 0xff,
	0x52, 0x50, 0x54, 0x58, 0x59, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x4c, 0x4b, 0x5a, 0x5b, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x54, 0x55, 0x59, 0x5e, 0x5d, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x55, 0x54, 0x58, 0x5d, 0x5e, 0x5a, 0xff, 0xff, 0xff, 0xff,
	0x56, 0x5b, 0x5f, 0x55, 0x59, 0x5e, 0xff, 0xff, 0xff, 0xff,
	0xff, 0x56, 0x5a, 0x5f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x4f, 0x50, 0x54, 0x58, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x58, 0x59, 0x5e, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x59, 0x58, 0x5d, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0x5b, 0x5a, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
}
