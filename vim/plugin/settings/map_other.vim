"search for highlighted text, without regex !
vnoremap // y/\V<C-R>"<CR>

"open the same directory as the current buffer !
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"taken from https://github.com/carlhuda/janus -> plugin/mappings.vim
nnoremap <F4> :set invpaste<CR>:set paste?<CR>

" format the entire file,
" mf   -> mark line inside f,
" gg=G -> reindent,
" 'f   -> go to last line
nnoremap <leader>fef mfgg=G'f

"display cursor column
nnoremap <leader>col :set invcursorcolumn<CR>
