require("telescope").setup({
	defaults = {
		prompt_prefix = "🔭  ",
		sorting_strategy = "ascending",
	},
	extensions = {
		file_browser = {
			theme = "ivy",
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
	},
})
require("telescope").load_extension("env")
require("telescope").load_extension("file_browser")
