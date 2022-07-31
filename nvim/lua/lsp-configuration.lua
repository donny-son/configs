---@diagnostic disable: need-check-nil
vim.keymap.set("n", "<leader>gj", vim.diagnostic.goto_next, { buffer = 0 })
vim.keymap.set("n", "<leader>gk", vim.diagnostic.goto_prev, { buffer = 0 })

require("nvim-lsp-installer").setup({
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- formatting
require 'lsp-format'.setup {
  sql = { exclude = { "sqls" } }
}

-- attach when lsp server is triggered
local on_attach = function(client)
  require 'lsp-format'.on_attach(client)
  require 'lsp_signature'.on_attach()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
end

---------------
-- LANGUAGES --
---------------

-- dot language server >> npm i -g dot-language-server
require 'lspconfig'.dotls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- dockerfile language server >> npm i -g dockerfile-language-server-nodejs
require 'lspconfig'.dockerls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- go >> go install golang.org/x/tools/gopls@latest
require 'lspconfig'.gopls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- diagnostic >> npm i -g diagnostic-languageserver
require 'lspconfig'.diagnosticls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { 'lua' },
}

-- json, html, css, eslint >> npm i -g vscode-langservers-extracted
require 'lspconfig'.jsonls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

require 'lspconfig'.html.setup {
  capabilities = capabilities,
  on_attach = on_attach,

}

require 'lspconfig'.cssls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
require 'lspconfig'.eslint.setup {}

-- R >> install.packages("languageserver")
require 'lspconfig'.r_language_server.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- swift
local gon = require("get_os_name")
local os_name, arch_name = gon.get_os_name()
if os_name == 'Mac' then
  require 'lspconfig'.sourcekit.setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

-- sqls >> go install github.com/lighttiger2505/sqls
require 'lspconfig'.sqls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- bash >> npm i -g bash-language-server
require 'lspconfig'.bashls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- typescript >> npm install -g typescript typescript-language-server
require 'lspconfig'.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- solidity >> npm i -g solidity-language-server
require 'lspconfig'.solidity_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- markdown >> cargo install prosemd-lsp
require 'lspconfig'.prosemd_lsp.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- tabnine
local tabnine = require('cmp_tabnine.config')
tabnine:setup({
  max_lines = 1000;
  max_num_results = 20;
  sort = true;
  run_on_every_keystroke = true;
  snippet_placeholder = '..';
  ignored_file_types = { -- default is not to ignore
    env = true,
  };
  show_prediction_strength = true;
})

-- lua
-- mac >> brew install lua-language-server
-- linux >> download binaries from https://github.com/sumneko/lua-language-server/releases.
require 'lspconfig'.sumneko_lua.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
  on_attach = on_attach,
}

-- python(pyright) >> npm i -g pyright
require 'lspconfig'.pyright.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- python(jedi) >> poetry add jedi jedi-language-server
require 'lspconfig'.jedi_language_server.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- vimscript
require 'lspconfig'.vimls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- toml files
require 'lspconfig'.taplo.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- tailwindcss
require 'lspconfig'.tailwindcss.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- json, yaml linter
require 'lspconfig'.yamlls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- Rust
require 'lspconfig'.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- pictograms for completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }
local ok, lspkind = pcall(require, "lspkind")
if not ok then
  return
end
lspkind.init()

-- completion configuration
local cmp = require('cmp')
cmp.setup({
  insert = true,
  snippet = {
    expand = function(args)
      local luasnip = require('luasnip')
      if not luasnip then
        return
      end
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        luasnip = "[✂️]",
        buffer = "[📄]",
        nvim_lsp = "[📚]",
        nvim_lua = "[]",
        path = "[📁]",
        cmp_tabnine = "[🤖]",
        emoji = "[🌭]",
        calc = "[]",
      }
    }
  },
  window = {
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-s>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'cmp_tabnine' },
    { name = 'buffer', keyword_length = 2 },
    { name = 'nvim_lua' },
    { name = 'emoji' },
    { name = 'calc' },
    { name = 'nvim_lsp_signature_help' },
  })
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Toggle LSP diagnostic
require 'toggle_lsp_diagnostics'.init()

-- fidget
require 'fidget'.setup {}

-- neogit
require 'neogit'.setup {}

-- snippets
require "luasnip.loaders.from_snipmate".lazy_load()
