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
nnoremap <c-p> :NvimTreeToggle<CR>
inoremap <c-p> <Esc>:NvimTreeToggle<CR>
tnoremap <c-p> <c-\><c-n>:NvimTreeToggle<CR>

" terminal
nnoremap <c-q> <cmd>NeotermToggle<CR>
inoremap <c-q> <Esc><cmd>NeotermToggle<CR>
tnoremap <c-q> <c-\><c-n><cmd>NeotermToggle<CR>

" luasnip
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
imap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

vnoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
vnoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
