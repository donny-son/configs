return function(_, opts)
  local notify = require "notify"
  notify.setup {
    background_colour = "Normal",
    fps = 60,
    icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = "",
    },
    level = 2,
    minimum_width = 50,
    render = "default",
    stages = "fade_in_slide_out",
    timeout = 2000,
    top_down = false,
  }

  vim.notify = notify
end
