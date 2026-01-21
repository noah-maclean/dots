local wezterm = require("wezterm")
local config = {
	enable_wayland = false,
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 14,

	color_scheme = "tokyonight",
	hide_tab_bar_if_only_one_tab = true,
	window_background_opacity = 0.8,

	default_cursor_style = "BlinkingBar",
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",

    window_close_confirmation = "NeverPrompt",
}

return config
