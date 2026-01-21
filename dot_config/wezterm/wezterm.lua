local wezterm = require("wezterm")
local config = {}

config.enable_wayland = false
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14
config.color_scheme = "tokyonight"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.8

config.default_cursor_style = "BlinkingBar"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

return config
