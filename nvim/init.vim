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
source $HOME/.config/nvim/post-plugins/panemanagement-config.vim
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
autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | exe 'Telescope find_files' | endif
autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()
