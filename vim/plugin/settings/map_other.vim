"search for highlighted text, without regex !
vnoremap // y/\V<C-R>"<CR>

"open the same directory as the current buffer !
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"taken from https://github.com/carlhuda/janus -> plugin/mappings.vim
nnoremap <F4> :set invpaste<CR>:set paste?<CR>
" format the entire file
nnoremap <leader>fef gg=G

"display cursor column
nnoremap <leader>col :set invcursorcolumn<CR>
