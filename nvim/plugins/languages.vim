Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'rstacruz/vim-hyperstyle'
Plug 'pantharshit00/vim-prisma'
Plug 'averms/black-nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-test/vim-test'
Plug 'sheerun/vim-polyglot' " language pack
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'onsails/lspkind.nvim'
Plug 'neo4j-contrib/cypher-vim-syntax'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'jalvesaq/Nvim-R', { 'branch': 'stable' }
Plug 'lukas-reineke/lsp-format.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'weilbith/nvim-code-action-menu'
Plug 'kosayoda/nvim-lightbulb'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
Plug 'github/copilot.vim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'folke/lua-dev.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'jghauser/follow-md-links.nvim'
Plug 'TimUntersberger/neogit'
Plug 'folke/trouble.nvim'


let test#strategy = "neovim"
let test#neovim#term_position = "botright"
let g:copilot_filetypes = {
\ '*': v:false,
\ 'python': v:true,
\ 'go': v:true,
\ 'javascript': v:true,
\ 'typescript': v:true,
\ 'markdown': v:true,
\ }
