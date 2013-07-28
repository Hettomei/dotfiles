" Use vim spell:
" zg Add word under the cursor as a good word_to_search
" zw Mark the word as a wrong (bad) word.wrong
" z= For the word under/after the cursor suggest correctly
" spelled words.

" Spell Check, used to togle between no spell and language. To add a language
" juste download a language from here : http://ftp.vim.org/vim/runtime/spell/
" , and copy paste in ~/.vim/spell/
let b:myLang=0
let g:myLangList=["nospell","fr","en"]
function! ToggleSpell()
  let b:myLang=b:myLang+1
  if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
  if b:myLang==0
    setlocal nospell
  else
    execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
  endif
  echo "spell checking language:" g:myLangList[b:myLang]
endfunction

nmap <F7> :call ToggleSpell()<CR>

"spell check when writing commit logs
if has("autocmd")
  autocmd filetype svn,*commit* set spell
endif
