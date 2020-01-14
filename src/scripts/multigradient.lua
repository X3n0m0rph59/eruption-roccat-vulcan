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

-- set gradient stops
gradient_stops = {
    [0] = { start = rgb_to_color(255,   0,   0), dest = rgb_to_color(255, 165,   0) },
    [1] = { start = rgb_to_color(255, 165,   0), dest = rgb_to_color(0,   255, 255) },
    [2] = { start = rgb_to_color(0,   255, 255), dest = rgb_to_color(0,   255,   0) },
    [3] = { start = rgb_to_color(0,   255,   0), dest = rgb_to_color(0,     0, 255) },
    [4] = { start = rgb_to_color(0,     0, 255), dest = rgb_to_color(75,    0, 130) },
    [5] = { start = rgb_to_color(75,    0, 130), dest = rgb_to_color(238, 130, 238) },
    [6] = { start = rgb_to_color(238, 130, 238), dest = rgb_to_color(255,   0,   0) },
    len = 7
}

-- global state variables --
color_map = {}
color_map_pressed = {}
ticks = 0

-- event handler functions --
function on_startup(config)
    init_state()
end

function on_quit(exit_code)
    init_state()
    set_color_map(color_map)
end

function on_key_down(key_index)
    color_map_pressed[key_index] = color_afterglow
end

function on_tick(delta)
    ticks = ticks + delta + 1
    
    local num_keys = get_num_keys()

    -- animate gradient
    if animate_gradient and (ticks % gradient_step == 0) then
        for i = 0, num_keys do
            color_map[i] = linear_gradient_multi(gradient_stops, i + ticks)
        end
    end

    -- calculate afterglow effect for pressed keys
    if ticks % afterglow_step == 0 then
        for i = 0, num_keys do
            if color_map_pressed[i] > color_off then
                color_map_pressed[i] = color_map_pressed[i] - color_step_afterglow

                if color_map_pressed[i] < color_off then
                    color_map_pressed[i] = color_off
                end
            end
        end
    end

    -- now combine all the color maps to a final map
    local color_map_combined = {}
    for i = 0, num_keys do
        color_map_combined[i] = color_map[i] + color_map_pressed[i]

        -- let the afterglow effect override all other effects
        if color_map_pressed[i] > color_off then
            color_map_combined[i] = color_map_pressed[i]
        end

        if color_map_combined[i] >= 0x00ffffff then
            color_map_combined[i] = 0x00ffffff
        elseif color_map_combined[i] <= 0x00000000 then
            color_map_combined[i] = 0x00000000
        end
    end

    set_color_map(color_map_combined)
end

-- init global state
function init_state()
    local num_keys = get_num_keys()
    for i = 0, num_keys do
        color_map[i] = linear_gradient_multi(gradient_stops, (i * num_keys / 100))
        color_map_pressed[i] = color_off
    end
end

-- support functions
function linear_gradient_multi(stops, p)
    local i = clamp(trunc(p / (100 * stops.len)), 0, stops.len - 1)

    -- info("p: " .. p .. " " .. "index: " .. i)

    local s = stops[i].start
    local e = stops[i].dest

    local result = linear_gradient(s, e, p / color_divisor)

    -- info("result: " .. result)

    return result
end