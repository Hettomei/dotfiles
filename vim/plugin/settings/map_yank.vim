" "*y Copy to 'clipboard registry'
" Work like 'y' but copy in OS clipboard (géniaaaal !!)
" Dont use nmap because we need in vmap
" Don't use noremap because it not understand << Y$ >>

" save in clipboard
vmap Y "*y
nnoremap YY ^"*y$

" Yank the word on which i am
nnoremap <Leader>y yiw
" Yank the word on which i am and put it in the clipboard
nnoremap <Leader>Y "*yiw

" Make Y behave like C and D.
" taken from https://github.com/tpope/vim-sensible
nmap Y y$
