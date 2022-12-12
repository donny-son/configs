" Code related
Plug 'jghauser/fold-cycle.nvim' " Code folding
Plug 'folke/which-key.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'AckslD/nvim-FeMaco.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " :TSInstall all
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'nanotee/sqls.nvim'
" ColorSchemes
Plug 'ray-x/aurora'
Plug 'sainnhe/everforest'
Plug 'folke/lsp-colors.nvim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'rafamadriz/neon'
Plug 'bluz71/vim-nightfly-guicolors'
" Debugging
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'leoluz/nvim-dap-go'
Plug 'rcarriga/nvim-dap-ui'
Plug 'rcarriga/cmp-dap'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'theHamsta/nvim-dap-virtual-text'
" File Management
Plug 'kyazdani42/nvim-tree.lua'
Plug 'LinArcX/telescope-env.nvim'
Plug 'kdheepak/lazygit.nvim'
Plug 'startup-nvim/startup.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
" Formatting Related
Plug 'rstacruz/vim-closer'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
Plug 'sotte/presenting.vim'
Plug 'mechatroner/rainbow_csv'
Plug 'dhruvasagar/vim-table-mode'
Plug 'kylechui/nvim-surround'
" FZF
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Language Related
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'rstacruz/vim-hyperstyle'
Plug 'vim-test/vim-test'
Plug 'sheerun/vim-polyglot' " language pack
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'onsails/lspkind.nvim'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'lukas-reineke/lsp-format.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'kosayoda/nvim-lightbulb'
Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'folke/lua-dev.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'jghauser/follow-md-links.nvim'
Plug 'TimUntersberger/neogit'
Plug 'folke/trouble.nvim'
Plug 'MunifTanjim/eslint.nvim'
Plug 'leafOfTree/vim-matchtag'
" Lines
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
" UI
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ap/vim-css-color'
Plug 'declancm/cinnamon.nvim' " smooth scrolling
Plug 'j-hui/fidget.nvim' " ui for lsp
Plug 'rcarriga/nvim-notify'
Plug 'sbdchd/neoformat'
Plug 'itmecho/neoterm.nvim'

" Setup Options for some plugins
let g:neoformat_try_node_exe = 1
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
let test#strategy = "neovim"
let test#neovim#term_position = "botright"
let g:vim_matchtag_enable_by_default = 1
let g:vim_matchtag_files = '*.html,*.xml,*.js,*.jsx,*.vue,*.svelte,*.jsp'
au FileType markdown let b:presenting_slide_separator = '\v(^|\n)\-{3,}'

