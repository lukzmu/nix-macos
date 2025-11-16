local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.initial_cols = 220
config.initial_rows = 60
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.6
config.macos_window_background_blur = 10
config.font_size = 11
config.send_composed_key_when_left_alt_is_pressed = true
config.window_decorations = "RESIZE"

local act = wezterm.action
config.keys = {
    { key = "z", mods = "CTRL|SHIFT", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
    { key = "x", mods = "CTRL|SHIFT", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
    { key = "c", mods = "CTRL|SHIFT", action = act.CloseCurrentPane({ confirm = true }) },
}

return config
