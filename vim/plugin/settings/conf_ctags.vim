" CTags

let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
" Reload tag
command Rtags execute "!/usr/local/bin/ctags --extra=+f -R *"
nnoremap <C-$> :tnext<CR>
