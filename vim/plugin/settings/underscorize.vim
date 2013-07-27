"This fonction convert any upper case to _letter
"example : HiTheirLol -> hi_their_lol

"help from here
"http://stackoverflow.com/questions/10572996/passing-command-range-to-a-function
command -range Under <line1>,<line2>call UnderscoreAll()

" Idea of function taken here :
" http://www.ibm.com/developerworks/linux/library/l-vim-script-2/
function UnderscoreAll() range
  "Step through each line in the range...
  for linenum in range(a:firstline, a:lastline)
    let curr_line   = getline(linenum)
    " from ruby on rails
    " http://api.rubyonrails.org/classes/ActiveSupport/Inflector.html#method-i-underscore
    let replacement = substitute(curr_line  , '\([A-Z\d]+\)\([A-Z][a-z]\)', '\1_\2', 'g')
    let replacement = substitute(replacement, '\([a-z\d]\)\([A-Z]\)'      , '\1_\2', 'g')
    let replacement = tolower(replacement)
    call setline(linenum, replacement)
  endfor
endfunction
