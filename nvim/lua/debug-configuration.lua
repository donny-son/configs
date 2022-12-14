-- nvim-dap-go
local dapgo = require("dap-go")
dapgo.setup()

-- nvim-dap-python
local venv = os.getenv("VIRTUAL_ENV")
local dappython = require("dap-python")
dappython.test_runner = "pytest"
dappython.setup(string.format("%s/bin/python", venv))

local dap = require("dap")

-- remember to delete vscode launch.json trailing comma
require("dap.ext.vscode").load_launchjs()

vim.fn.sign_define("DapBreakpoint", { text = "🍎", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🐛", texthl = "", linehl = "", numhl = "" })

require("dapui").setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	expand_lines = vim.fn.has("nvim-0.7"),
	layouts = {
		{
			elements = {
				"scopes",
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 60,
			position = "left",
		},
		{
			elements = {
				"repl",
				-- 'console',
			},
			size = 10,
			position = "bottom",
		},
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "double", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
	},
})

require("nvim-dap-virtual-text").setup()

local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
