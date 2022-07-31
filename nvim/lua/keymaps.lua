-- jj -> <Esc>
vim.keymap.set('i', 'jj', '<Esc>',
  { remap = true, desc = 'double j to escape' })

-- window management
vim.keymap.set('n', '<leader>q', '<cmd>bd<cr>',
  { remap = false, desc = 'Close buffer softly' })
vim.keymap.set('n', '<leader>wK', '<cmd>resize +12<cr>',
  { remap = false, desc = 'Increase buffer size height' })
vim.keymap.set('n', '<leader>wJ', '<cmd>resize -12<cr>',
  { remap = false, desc = 'Decrease buffer size height' })
vim.keymap.set('n', '<leader>wk', '<cmd>resize +12<cr>',
  { remap = false, desc = 'Increase buffer size width' })
vim.keymap.set('n', '<leader>wj', '<cmd>resize -12<cr>',
  { remap = false, desc = 'Decrease buffer size width' })

-- code folding
vim.keymap.set('n', '<leader>co',
  function() return require('fold-cycle').open() end,
  { silent = true, desc = 'Fold-cycle: open folds' })
vim.keymap.set('n', '<leader>cc',
  function() return require('fold-cycle').close() end,
  { silent = true, desc = 'Fold-cycle: close folds' })
vim.keymap.set('n', '<leader>cz',
  function() return require('fold-cycle').toggle_all() end,
  { remap = true, silent = true, desc = 'Fold-cycle: toggle folds' })

-- symbols outline
vim.keymap.set('n', '<C-y>',
  '<cmd>SymbolsOutline<cr>',
  { remap = true, silent = true, desc = 'Toggle SymbolsOutline' })

-- refresh init.vim and pluginstall
vim.keymap.set(
  'n',
  '<leader>zz',
  '<cmd>source ~/.config/nvim/init.vim | PlugInstall<cr>',
  { remap = false, desc = 'Refresh and PlugInstall' }
)

-- telescope
vim.keymap.set('n', '<leader><Space>', '<cmd>Telescope live_grep<cr>',
  { remap = false, desc = 'Telescope find files by filename' })
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>',
  { remap = false, desc = 'Telescope grep files' })
vim.keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>',
  { remap = false, desc = 'Telescope Keymaps' })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>',
  { remap = false, desc = 'Telescope search for help' })
vim.keymap.set('n', '<leader>fw', '<cmd>Telescope current_buffer_fuzzy_find<cr>',
  { remap = false, desc = 'Telescope search for word in current buffer' })
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>',
  { remap = false, desc = 'Telescope search for diagnostics' })

-- neogit
vim.keymap.set(
  'n',
  '<leader>ng',
  '<cmd>Neogit<cr>',
  { remap = false, silent = true, desc = 'Start Neogit' }
)

-- bufferline
vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>',
  { remap = false, silent = true, desc = 'Move to next buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>',
  { remap = false, silent = true, desc = 'Move to previous buffer' })

-- database
vim.keymap.set('n', '<leader>DB', '<cmd>DBUIToggle<cr>',
  { remap = false, silent = true, desc = 'Toggle Database UI' })

-- markdown
vim.keymap.set('n', '<leader>md', '<Plug>MarkdownPreviewToggle',
  { remap = false, silent = false, desc = 'Open markdown preview in browser' })

-- diagnostics
-- Lua
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
  { silent = true, noremap = true, desc = 'Toggle Trouble' }
)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",
  { silent = true, noremap = true, desc = 'Trouble workspace diagnostics' }
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>",
  { silent = true, noremap = true, desc = 'Trouble document diagnostics' }
)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
  { silent = true, noremap = true, desc = 'Trouble loclist' }
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
  { silent = true, noremap = true, desc = 'Trouble quickfix' }
)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
  { silent = true, noremap = true, desc = 'Trouble lsp reference' }
)
