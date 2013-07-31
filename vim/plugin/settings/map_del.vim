"when use x, do not send to test register <""> but send to black hole
"register "_ (ie void, or /dev/null or divide by 0...), <dl> is = <x>
nnoremap x "_x
nnoremap X "_X
vnoremap x "_x
vnoremap X "_X

" Yank the word on which i am
nmap <Leader>d diw
" Yank the word on which i am and put it in the clipboard
nmap <Leader>D "*diw
" Remove the word under the cursor and go in insert mode
