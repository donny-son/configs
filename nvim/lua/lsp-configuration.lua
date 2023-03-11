---
-- Keybindings
---
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function()
		local bufmap = function(mode, lhs, rhs)
			local opts = { buffer = true }
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
		bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
		bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
		bufmap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
		bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
		bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
		bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
		bufmap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
		bufmap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<cr>")
		bufmap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
		bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
		bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
		bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
	end,
})

-----------------
-- Diagnostics --
-----------------

local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = "",
	})
end

sign({ name = "DiagnosticSignError", text = "✘" })
sign({ name = "DiagnosticSignWarn", text = "▲" })
sign({ name = "DiagnosticSignHint", text = "⚑" })
sign({ name = "DiagnosticSignInfo", text = "" })

vim.diagnostic.config({
	virtual_text = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

---
-- LSP config
---

require("mason").setup({})
require("mason-lspconfig").setup({})

local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities =
	vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

require("mason").setup({
	automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})

---------------
-- LANGUAGES --
---------------
-- formatting
require("lsp-format").setup({
	sql = { exclude = { "sqls" } },
})
require("lspconfig").volar.setup({})
-- require("lspconfig").vuels.setup({})
require("lspconfig").astro.setup({})
require("lspconfig").svelte.setup({})
require("lspconfig").prismals.setup({})
require("lspconfig").dotls.setup({})
require("lspconfig").dockerls.setup({})
require("lspconfig").gopls.setup({})
-- require("lspconfig").diagnosticls.setup({})
require("lspconfig").jsonls.setup({})
require("lspconfig").html.setup({})
require("lspconfig").cssls.setup({})
require("lspconfig").eslint.setup({})
local gon = require("get_os_name")
local os_name, _ = gon.get_os_name()
if os_name == "Mac" then
	require("lspconfig").sourcekit.setup({})
end
require("lspconfig").sqls.setup({})
require("lspconfig").bashls.setup({})
require("lspconfig").tsserver.setup({})
require("lspconfig").prosemd_lsp.setup({})
-- tabnine
local tabnine = require("cmp_tabnine.config")
tabnine:setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
	ignored_file_types = { -- default is not to ignore
		env = true,
	},
	show_prediction_strength = true,
})

local lspconfig_util = require("lspconfig.util")
local pyproject_root = lspconfig_util.root_pattern("pyproject.toml")
-- require("lspconfig").jedi_language_server.setup({
-- 	root_dir = pyproject_root,
-- })
require("lspconfig").pyright.setup({})
-- require("lspconfig").ruff_lsp.setup({})
require("lspconfig").vimls.setup({})
require("lspconfig").taplo.setup({})
require("lspconfig").tailwindcss.setup({})
require("lspconfig").yamlls.setup({})
require("lspconfig").rust_analyzer.setup({})

---
-- Autocomplete
---
vim.opt.completeopt = { "menu", "menuone", "noselect" }

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
local select_opts = { behavior = cmp.SelectBehavior.Select }
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp", keyword_length = 2 },
		{ name = "buffer", keyword_length = 2 },
		{ name = "cmp_tabnine", keyword_length = 2 },
		{ name = "luasnip", keyword_length = 2 },
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		format = function(entry, vim_item)
			-- if you have lspkind installed, you can use it like
			-- in the following line:
			vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
			vim_item.menu = source_mapping[entry.source.name]
			if entry.source.name == "cmp_tabnine" then
				local detail = (entry.completion_item.data or {}).detail
				vim_item.kind = ""
				if detail and detail:find(".*%%.*") then
					vim_item.kind = vim_item.kind .. " " .. detail
				end

				if (entry.completion_item.data or {}).multiline then
					vim_item.kind = vim_item.kind .. " " .. "[ML]"
				end
			end
			local maxwidth = 80
			vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
			return vim_item
		end,
	},
	mapping = {
		["<Up>"] = cmp.mapping.select_prev_item(select_opts),
		["<Down>"] = cmp.mapping.select_next_item(select_opts),

		["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
		["<C-n>"] = cmp.mapping.select_next_item(select_opts),

		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),

		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),

		["<C-d>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),

		["<C-b>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),

		["<Tab>"] = cmp.mapping(function(fallback)
			local col = vim.fn.col(".") - 1

			if cmp.visible() then
				cmp.select_next_item(select_opts)
			elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
				fallback()
			else
				cmp.complete()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item(select_opts)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
})

require("toggle_lsp_diagnostics").init()
require("fidget").setup({})
require("neogit").setup({})

local eslint = require("eslint")
eslint.setup({
	bin = "eslint", -- or `eslint_d`
	code_actions = {
		enable = true,
		apply_on_save = {
			enable = true,
			types = { "problem" }, -- "directive", "problem", "suggestion", "layout"
		},
		disable_rule_comment = {
			enable = true,
			location = "separate_line", -- or `same_line`
		},
	},
	diagnostics = {
		enable = true,
		report_unused_disable_directives = false,
		run_on = "type", -- or `save`
	},
})

require("nvim-treesitter.configs").setup({
	incremental_selection = { enable = true },
	textobjects = { enable = true },
	context_commentstring = {
		enable = true,
		commentary_integration = {
			-- change default mapping
			Commentary = "g/",
			-- disable default mapping
			CommentaryLine = false,
		},
		config = {
			javascript = {
				__default = "// %s",
				jsx_element = "{/* %s */}",
				jsx_fragment = "{/* %s */}",
				jsx_attribute = "// %s",
				comment = "// %s",
			},
			typescript = { __default = "// %s", __multiline = "/* %s */" },
		},
	},
})

require("symbols-outline").setup()
