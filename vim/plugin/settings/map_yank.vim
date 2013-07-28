" "*y Copy to 'clipboard registry'
" Work like 'y' but copy in OS clipboard (géniaaaal !!)
" Dont use nmap because we need in vmap
" Don't use noremap because it not understand << Y$ >>
map Y "*y
nmap YY ^"*y$

" Yank the word on which i am
nmap <Leader>y yiw
" Yank the word on which i am and put it in the clipboard
nmap <Leader>Y "*yiw
" Remove the word under the cursor and go in insert mode
