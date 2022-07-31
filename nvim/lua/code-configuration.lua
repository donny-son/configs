require('fold-cycle').setup({
  open_if_max_closed = true, -- closing a fully closed fold will open it
  close_if_max_opened = true, -- opening a fully open fold will close it
  softwrap_movement_fix = false -- see below
})

-- diagnostics
require("trouble").setup {}
