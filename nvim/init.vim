set nocompatible              
set clipboard+=unnamedplus
filetype on     
filetype plugin on
filetype plugin indent on
syntax enable
set hlsearch
set mouse=a
set hidden
set nobackup
set nowritebackup
set shortmess+=c
set noimd
set cursorline
set noerrorbells
set noswapfile
set ruler
set noswapfile
set incsearch
set conceallevel=0
set encoding=utf-8
set fileencoding=utf-8
set smartindent
set nu
set clipboard=unnamedplus
set t_Co=256
set splitbelow
set splitright
set foldmethod=indent
set foldlevel=99
set rnu
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set updatetime=300
set formatoptions-=cro
set fileformat=unix
set ruler
set incsearch
set termguicolors
set scrolloff=30
set signcolumn=yes
set noshowmode
set langmap=ㅁa,ㅠb,ㅊc,ㅇd,ㄷe,ㄹf,ㅎg,ㅗh,ㅑi,ㅓj,ㅏk,ㅣl,ㅡm,ㅜn,ㅐo,ㅔp,ㅂq,ㄱr,ㄴs,ㅅt,ㅕu,ㅍv,ㅈw,ㅌx,ㅛy,ㅋz
set guicursor+=a:-blinkwait175-blinkoff150-blinkon175

call plug#begin('~/.vim/plugged')
source $HOME/.config/nvim/plugins/plugins.vim
call plug#end()

source $HOME/.config/nvim/plugins/markdownviewer-config.vim
source $HOME/.config/nvim/plugins/keymaps.vim

lua require('basics')
lua require('nvim-tree-configuration')
lua require('buffer-configuration')
lua require('lsp-configuration')
lua require('debug-configuration')
lua require('telescope-configuration')
lua require('code-configuration')
lua require('keymaps')
lua require('colorscheme')

autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()

if exists("g:neovide")
  lua require('neovide-config')
  let g:neovide_transparency=0.9
  let g:neovide_refresh_rate=120
  let g:neovide_cursor_vfx_mode = "railgun"
else
  autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | exe 'Telescope find_files' | endif
endif
