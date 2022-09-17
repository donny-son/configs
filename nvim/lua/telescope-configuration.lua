require('telescope').setup {
  defaults = {
    prompt_prefix = "🔭  ",
    sorting_strategy = "ascending"
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    }
  }
}
require('telescope').load_extension('env')
require('telescope').load_extension('file_browser')

-- Setup global config
require('neoterm').setup({
  clear_on_run = true, -- run clear command before user specified commands
  mode = 'horizontal', -- vertical/horizontal/fullscreen
  noinsert = false -- disable entering insert mode when opening the neoterm window
})

-- color picker
-- require("colortils").setup({
--   -- Register in which color codes will be copied
--   register = "+",
--   -- Preview for colors, if it contains `%s` this will be replaced with a hex color code of the color
--   color_preview = "█ %s",
--   -- The default in which colors should be saved
--   -- This can be hex, hsl or rgb
--   default_format = "hex",
--   -- Border for the float
--   border = "rounded",
--   -- Some mappings which are used inside the tools
--   mappings = {
--     increment_big = "L",
--     decrement_big = "H",
--   }
-- })
