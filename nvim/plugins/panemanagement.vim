" Plug 'christoomey/vim-tmux-navigator'
Plug 'sbdchd/neoformat'
Plug 'itmecho/neoterm.nvim'
" Plug 'kassio/neoterm'

let g:neoformat_try_node_exe = 1
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
