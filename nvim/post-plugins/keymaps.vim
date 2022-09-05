let mapleader=" "

" Create file
noremap <leader>cf :call CreateFile(expand("<cfile>"))<CR>
function! CreateFile(tfilename)

    " complete filepath from the file where this is called
    let newfilepath=expand('%:p:h') .'/'. expand(a:tfilename)

    if filereadable(newfilepath)
       echo "File already exists"
       :norm gf
    else
        :execute "!touch ". expand(newfilepath)
        echom "File created: ". expand(newfilepath)
        :norm gf
    endif
endfunction

" Explorer
nnoremap <silent><c-p> :NvimTreeFindFileToggle<CR>
inoremap <silent><c-p> <Esc>:NvimTreeFindFileToggle<CR>
tnoremap <silent><c-p> <c-\><c-n>:NvimTreeFindFileToggle<CR>

" terminal
nnoremap <c-t> <cmd>NeotermToggle<CR>
inoremap <c-t> <Esc><cmd>NeotermToggle<CR>
tnoremap <c-t> <c-\><c-n><cmd>NeotermToggle<CR>

" luasnip
" imap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>  " some problem
" with telescope keymap settings.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

nnoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
nnoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

vnoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
vnoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
