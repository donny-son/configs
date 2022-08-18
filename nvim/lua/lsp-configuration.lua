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
local os_name, _ = gon.get_os_name()
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


-- python(jedi) >> poetry add jedi jedi-language-server
require 'lspconfig'.jedi_language_server.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- python(pyright) >> npm i -g pyright
require 'lspconfig'.pyright.setup {
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

-- vue
local lspconfig = require 'lspconfig'
local lspconfig_configs = require 'lspconfig.configs'
local lspconfig_util = require 'lspconfig.util'

local function on_new_config(new_config, new_root_dir)
  local function get_typescript_server_path(root_dir)
    local project_root = lspconfig_util.find_node_modules_ancestor(root_dir)
    return project_root and
        (lspconfig_util.path.join(project_root, 'node_modules', 'typescript', 'lib', 'tsserverlibrary.js'))
        or ''
  end

  if new_config.init_options
      and new_config.init_options.typescript
      and new_config.init_options.typescript.serverPath == ''
  then
    new_config.init_options.typescript.serverPath = get_typescript_server_path(new_root_dir)
  end
end

local volar_cmd = { 'vue-language-server', '--stdio' }
local volar_root_dir = lspconfig_util.root_pattern 'package.json'

lspconfig_configs.volar_api = {
  default_config = {
    cmd = volar_cmd,
    root_dir = volar_root_dir,
    on_new_config = on_new_config,
    filetypes = { 'vue' },
    -- If you want to use Volar's Take Over Mode (if you know, you know)
    --filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
    init_options = {
      typescript = {
        serverPath = ''
      },
      languageFeatures = {
        implementation = true, -- new in @volar/vue-language-server v0.33
        references = true,
        definition = true,
        typeDefinition = true,
        callHierarchy = true,
        hover = true,
        rename = true,
        renameFileRefactoring = true,
        signatureHelp = true,
        codeAction = true,
        workspaceSymbol = true,
        completion = {
          defaultTagNameCase = 'both',
          defaultAttrNameCase = 'kebabCase',
          getDocumentNameCasesRequest = false,
          getDocumentSelectionRequest = false,
        },
      }
    },
  }
}
lspconfig.volar_api.setup {}

lspconfig_configs.volar_doc = {
  default_config = {
    cmd = volar_cmd,
    root_dir = volar_root_dir,
    on_new_config = on_new_config,

    filetypes = { 'vue' },
    -- If you want to use Volar's Take Over Mode (if you know, you know):
    --filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
    init_options = {
      typescript = {
        serverPath = ''
      },
      languageFeatures = {
        implementation = true, -- new in @volar/vue-language-server v0.33
        documentHighlight = true,
        documentLink = true,
        codeLens = { showReferencesNotification = true },
        -- not supported - https://github.com/neovim/neovim/pull/15723
        semanticTokens = false,
        diagnostics = true,
        schemaRequestService = true,
      }
    },
  }
}
lspconfig.volar_doc.setup {}

lspconfig_configs.volar_html = {
  default_config = {
    cmd = volar_cmd,
    root_dir = volar_root_dir,
    on_new_config = on_new_config,

    filetypes = { 'vue' },
    -- If you want to use Volar's Take Over Mode (if you know, you know), intentionally no 'json':
    --filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    init_options = {
      typescript = {
        serverPath = ''
      },
      documentFeatures = {
        selectionRange = true,
        foldingRange = true,
        linkedEditingRange = true,
        documentSymbol = true,
        -- not supported - https://github.com/neovim/neovim/pull/13654
        documentColor = false,
        documentFormatting = {
          defaultPrintWidth = 100,
        },
      }
    },
  }
}
lspconfig.volar_html.setup {}

-- eslint, null-ls
local null_ls = require("null-ls")
local eslint = require("eslint")

null_ls.setup()

eslint.setup({
  bin = 'eslint', -- or `eslint_d`
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
