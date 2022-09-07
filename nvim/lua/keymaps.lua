local wkl = require('which-key')
vim.cmd('autocmd FileType * lua SetKeybinds()')
function SetKeybinds()
  local fileTy = vim.api.nvim_buf_get_option(0, "filetype")
  local opts = { prefix = '<leader>', buffer = 0 }
  if fileTy == 'python' then
    wkl.register({
      t = {
        name = "Debug Python",
        t = { "<cmd>lua require('dap-python').test_method()<CR>", "Test Function" },
        c = { "<cmd>lua require('dap-python').test_class()<CR>", "Test Class" },
        u = { "<cmd>!python -m unittest %<CR>", "Run Unittest" },
        p = { "<cmd>!python -m pytest %<CR>", "Run Pytest" },
      }
    }, opts)
  elseif fileTy == 'sh' then
    wkl.register({
      t = {
        name = "Debug Python",
        t = { "<cmd>lua require('dap-go').debug_test()<CR>", "Test Go" },
      }
    }, opts)
  end
end

-- vim-test
vim.keymap.set("n", "<leader>tt", "<cmd>TestNearest<CR>", { desc = "Test Nearset" })
vim.keymap.set("n", "<leader>tT", "<cmd>TestFile<CR>", { desc = "Test File" })
vim.keymap.set("n", "<leader>tl", "<cmd>TestSuite<CR>", { desc = "Test Suite" })
vim.keymap.set("n", "<leader>tg", "<cmd>TestVisit<CR>", { desc = "Test Visite" })

-- nvim dap
vim.keymap.set("n", "<leader>dd", ":lua require'dap'.continue()<CR>",
  { desc = "Toggle debugger & continue to breakpoint" }) -- start debugger

-- standard movements for stepping in and out
vim.keymap.set("n", "<leader>dj", ":lua require'dap'.step_into()<CR>",
  { desc = "Debug | Step Into" })
vim.keymap.set("n", "<leader>dk", ":lua require'dap'.step_out()<CR>",
  { desc = "Debug | Step Out" })
vim.keymap.set("n", "<leader>dn", ":lua require'dap'.step_over()<CR>",
  { desc = "Debug | Step Over | Next line" })
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>",
  { desc = "Debug | Toggle Breakpoint" })
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Debug | Toggle Conditional Breakpoint" })
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>",
  { desc = "Debug | Open REPL" })
vim.keymap.set("n", "<leader>dq", ":lua require'dap'.terminate()<CR>",
  { desc = "Debug | Quit Debugger" })

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


-- trouble
--
-- telescope
vim.keymap.set('n', '<leader><Space>',
  '<cmd>lua require("telescope.builtin").live_grep({glob_pattern = "!node_modules"})<cr>',
  { remap = false, desc = 'Telescope find files by filename' })
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>',
  { remap = false, desc = 'Telescope grep files' })
vim.keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>',
  { remap = false, desc = 'Telescope Keymaps' })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>',
  { remap = false, desc = 'Telescope search for help' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope current_buffer_fuzzy_find<cr>',
  { remap = false, desc = 'Telescope search for word in current buffer' })
vim.keymap.set('n', '<leader>fB', '<cmd>Telescope file_browser<cr>',
  { remap = false, desc = 'Telescope search for file browser' })

-- neogit
vim.keymap.set(
  'n',
  '<leader>ng',
  '<cmd>Neogit<cr>',
  { remap = false, silent = true, desc = 'Start Neogit' }
)

-- bufferline
vim.keymap.set('n', '<leader>p', '<cmd>BufferLineCycleNext<cr>',
  { remap = false, silent = true, desc = 'Move to next buffer' })
vim.keymap.set('n', '<leader>o', '<cmd>BufferLineCyclePrev<cr>',
  { remap = false, silent = true, desc = 'Move to previous buffer' })

-- database
vim.keymap.set('n', '<leader>DB', '<cmd>DBUIToggle<cr>',
  { remap = false, silent = true, desc = 'Toggle Database UI' })

-- markdown
vim.keymap.set('n', '<leader>md', '<Plug>MarkdownPreviewToggle',
  { remap = false, silent = false, desc = 'Open markdown preview in browser' })

-- trouble
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
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
