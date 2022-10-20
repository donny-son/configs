local wezterm = require 'wezterm';
return {
  font = wezterm.font({
    family = "VictorMono Nerd Font",
  }),
  font_size = 15,
  color_scheme = "Galizur",
  default_cursor_style = "BlinkingBlock",
  cursor_blink_ease_in = "Linear",
  cursor_blink_ease_out = "Linear",
  cursor_blink_rate = 500,
  animation_fps = 60,
  audible_bell = "Disabled",
  enable_tab_bar = false,
  line_height = 1.3,
  warn_about_missing_glyphs = false,
}
