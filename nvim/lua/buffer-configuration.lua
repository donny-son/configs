require("bufferline").setup()

require("cinnamon").setup()
require("lualine").setup({
	options = {
		theme = "nightfly",
	},
})

vim.notify = require("notify")
require("notify").setup({
	background_colour = "#000000",
	top_down = false,
})

require("nvim-surround").setup({})
require("neoterm").setup({
	clear_on_run = true, -- run clear command before user specified commands
	mode = "horizontal", -- vertical/horizontal/fullscreen
	noinsert = false, -- disable entering insert mode when opening the neoterm window
})
