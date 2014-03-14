"https://github.com/kien/ctrlp.vim
"let g:ctrlp_map = '<c-p>'
nnoremap <C-m> :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.hg$\|\.svn$\',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': 'some_bad_symbolic_links',
\ }
