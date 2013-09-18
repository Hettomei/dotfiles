"""""""""""""
" Searching "
"""""""""""""
set hlsearch
set incsearch
set noignorecase
"Stop search at end of the file
set nowrapscan

" when on a word, it search for this word
" and replace with the specified value
nnoremap <Leader>sr yiw:%s/<C-r>"//gc<Left><Left><Left>
nnoremap <Leader>SR yiW:%s/<C-r>"//gc<Left><Left><Left>
