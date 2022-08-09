local wezterm = require 'wezterm';
return {
  font = wezterm.font({
    family = "Hurmit Nerd Font Mono",
  }),
  font_size = 18,
  color_scheme = "SynthwaveAlpha",
  default_cursor_style = "BlinkingBlock",
  cursor_blink_ease_in = "Linear",
  cursor_blink_ease_out = "Linear",
  cursor_blink_rate = 1000,
  animation_fps = 60,
  audible_bell = "Disabled",
  enable_tab_bar = false,
  line_height = 1.2,
  warn_about_missing_glyphs = false,
}
