local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.initial_cols = 160
config.initial_rows = 40
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10
config.font_size = 11

return config
