local wezterm = require 'wezterm';
return {
  font = wezterm.font({
    family = "FiraCode Nerd Font Mono",
  }),
  font_size = 14,
  color_scheme = "BlulocoDark",
  default_cursor_style = "BlinkingBlock",
  cursor_blink_ease_in = "Linear",
  cursor_blink_ease_out = "Linear",
  cursor_blink_rate = 500,
  animation_fps = 60,
  audible_bell = "Disabled",
  enable_tab_bar = false,
  line_height = 1.2,
  warn_about_missing_glyphs = false,
}
