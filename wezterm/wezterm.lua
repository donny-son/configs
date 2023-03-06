local wezterm = require("wezterm")
return {
	font = wezterm.font({
		family = "FiraCode NF",
	}),
	font_size = 15,
	color_scheme = "Galizur",
	default_cursor_style = "BlinkingBlock",
	cursor_blink_ease_in = "Linear",
	cursor_blink_ease_out = "Linear",
	cursor_blink_rate = 400,
	animation_fps = 100,
	audible_bell = "Disabled",
	enable_tab_bar = true,
	line_height = 1.1,
	warn_about_missing_glyphs = false,
}
