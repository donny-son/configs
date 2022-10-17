source $HOME/.config/nvim/basic-configuration.vim

call plug#begin('~/.vim/plugged')
source $HOME/.config/nvim/plugins/formatting.vim
source $HOME/.config/nvim/plugins/prettythings.vim
source $HOME/.config/nvim/plugins/fzf.vim
source $HOME/.config/nvim/plugins/languages.vim
source $HOME/.config/nvim/plugins/lines.vim
source $HOME/.config/nvim/plugins/filemanagement.vim
source $HOME/.config/nvim/plugins/panemanagement.vim
source $HOME/.config/nvim/plugins/debugging.vim
source $HOME/.config/nvim/plugins/code.vim
source $HOME/.config/nvim/plugins/colorscheme.vim
call plug#end()

source $HOME/.config/nvim/post-plugins/markdownviewer-config.vim
source $HOME/.config/nvim/post-plugins/keymaps.vim

lua require('nvim-tree-configuration')
lua require('buffer-configuration')
lua require('lsp-configuration')
lua require('debug-configuration')
lua require('telescope-configuration')
lua require('code-configuration')
lua require('keymaps')
lua require('colorscheme')

autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()
autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js,*.vue,*.svelte EslintFixAll

if exists("g:neovide")
  lua require('neovide-config')
  let g:neovide_transparency=0.9
  let g:neovide_refresh_rate=120
  let g:neovide_cursor_vfx_mode = "railgun"
else
  autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | exe 'Telescope find_files' | endif
endif
