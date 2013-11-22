" switch between windows
nmap <C-k> :wincmd k<CR>
nmap <C-j> :wincmd j<CR>
nmap <C-h> :wincmd h<CR>
nmap <C-l> :wincmd l<CR>

" act like browsers do
nnoremap <Space> <c-d>
" not working on iterm, because shift space doesn t exist
" Add a key map on ITERM :) now it works
nnoremap <S-Space> <c-u>
