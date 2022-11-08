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
  cursor_blink_rate = 300,
  animation_fps = 120,
  audible_bell = "Disabled",
  enable_tab_bar = true,
  line_height = 1.3,
  warn_about_missing_glyphs = false,
}
