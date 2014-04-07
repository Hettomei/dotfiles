" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
" }

" Tips and tricks {
" ## To add an abbrev for a specifiq filetype :
" autocmd FileType javascript :iabbrev <buffer> cl console.log();<left><left>
" }

" abbrev rails {
" theise abbrev are for rails
" TODO : add a autocommand for filetype .rb for these abbrev

ab cq customer_quote
ab CQ CustomerQuote

ab ob online_booking
ab OB OnlineBooking

ab cci customer_commercial_info
ab CCI CustomerCommercialInfo

ab mb my_bookings

ab br boat_request
ab BR BoatRequest

ab sr sailing_resume
ab SR SailingResume

ab sp special_offer
ab SP SpecialOffer

ab bh boarding_harbor

ab lh landing_harbor
" }

" backup swap {
" No save backup like .swp
" TODO understand difference beetween backup and swap
set nowritebackup
set noswapfile
" }

" colors {
set background=dark
colorscheme solarized
" }

" CTags ctags {
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
" Reload tag
command Rtags execute "!/usr/local/bin/ctags --extra=+f -R *"
nnoremap <C-$> :tnext<CR>
" }

" ctrlp {
"https://github.com/kien/ctrlp.vim
"let g:ctrlp_map = '<c-p>'
nnoremap <C-m> :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$\',
      \ 'file': '\.exe$\|\.so$\|\.dll$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
" }

" configure display {

" cursor position
set ruler

" Status bar
set laststatus=2

set cursorline

" Show (partial) command in the status line
set showcmd

"Suppress mode change messages
set noshowmode

"Display &nbsp and trailing space :
set list listchars=nbsp:•,trail:¬
" }

" configure folding {
set foldmethod=syntax
set foldlevel=6

au BufRead,BufNewFile *.{yml,yaml,slim,haml} set foldmethod=indent
" }

" configure when open large_files {
" http://vim.wikia.com/wiki/Faster_loading_of_large_files
" Protect large files from sourcing and other overhead.
" Files become read only
if !exists("auto_load_large_file")
  let auto_load_large_file = 1
  " Set options:
  " eventignore+=FileType (no syntax highlighting etc
  " assumes FileType always on)
  " noswapfile (save copy of file)
  " bufhidden=unload (save memory when other file is viewed)
  " buftype=nowritefile (is read-only)
  " undolevels=-1 (no undo possible)
  " Large files are > 2M
  let g:LargeFile = 1024 * 1024 * 2
  augroup LargeFile
    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
    augroup END
  endif
  " }

" line number {
set number
set numberwidth=1
" }

" NERDTree nerdtree {
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>
" }

" custom rails mapping {
command Rlang execute "tabnew config/locales/en.yml | vsplit config/locales/fr.yml"
command RlangProfile execute "tabnew config/locales/my_profile.en.yml | vsplit config/locales/my_profile.fr.yml"
command RlangDevise execute "tabnew config/locales/devise.en.yml | vsplit config/locales/devise.fr.yml"
" }

" For vim-rails {
" help -> :help rails-projection
let g:rails_projections = {
      \ "app/decorators/*_decorator.rb": {
      \   "command": "decorator",
      \   "template":
      \     "class %SDecorator < ApplicationDecorator\nend",
      \   "test": [
      \     "spec/decorators/%s_decorator_spec.rb"
      \   ],
      \   "alternate": 'app/models/%s.rb'
      \ },
      \ "spec/fabricators/*_fabricator.rb": {
      \   "command": "fabricator",
      \   "template":
      \     "Fabricate(:%S)\nend",
      \   "test": [
      \     "spec/models/%s_spec.rb"
      \   ],
      \ },
      \ "app/repository/*_repository.rb": {
      \   "command": "repository",
      \   "template":
      \     "class %SRepository\nend",
      \   "test": [
      \     "spec/repository/%s_repository_spec.rb"
      \   ],
      \ },
      \ "app/assets/stylesheets/*css": {
      \   "command": "css",
      \ },
      \ "app/assets/javascripts/*js": {
      \   "command": "javascript",
      \ },
      \ "features/support/*.rb": {"command": "support"},
      \ "features/support/env.rb": {"command": "support"}
      \}
" }

" snipmate {
let g:snippets_dir=globpath(&runtimepath, 'my_snippets')
" }

" tabularize {
AddTabularPattern arrow /=>
" }

" wildignore {
" Patter ignore when use the completion in search file
set wildignore+=*.o,*.obj,*~,#*#,*.pyc,*.tar*,*.avi,*.ogg,*.mp3
set wildignore+=.git,*.rbc,*.class,.svn,vendor/gems/*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.exe
" }

" gist-vim defaults {
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
" }

"last_location.vim
" Remember last location in file

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

"map_del.vim
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

" Remove the word under the cursor
" Do not save the word in any register
" and go in insert mode
nmap <Leader>r "_ciw

"map_fold.vim
" folding map
"nnoremap ZA :set foldlevel=10<CR>
"nnoremap ZB :set foldlevel=1<CR>
"nnoremap ZBB :set foldlevel=2<CR>
"nnoremap ZBBB :set foldlevel=3<CR>
"Just need to learn zr and co !

"map_other.vim
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

"map_paste.vim
" If you visually select something and hit paste
" that thing gets yanked into your buffer. This
" generally is annoying when you're copying one item
" and repeatedly pasting it. This changes the paste
" command in visual mode so that it doesn't overwrite
" whatever is in your paste buffer.
" taken here
" http://yanpritzker.com/2012/01/20/the-cleanest-vimrc-youve-ever-seen/
vnoremap p "_dp
vnoremap P "_dP
nnoremap <leader>p "_ciw<C-r>"<esc>
"http://vim.wikia.com/wiki/Selecting_your_pasted_text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

"map_rails.vim

"map_split.vim
" Switch directly to the new splitted window
nnoremap <C-w>v :rightbelow vsplit<CR>
nnoremap <C-w>s :split<CR> :wincmd j<CR>

"map_surround.vim
" when on a word, change 'word' to '#{word}' (usefull for ruby)

" Leader a , with a like accolade
nnoremap <Leader>sa diwi#{<C-r>"}<ESC>
nnoremap <Leader>sA diWi#{<C-r>"}<ESC>

nnoremap <Leader>s' diwi'<C-r>"'<ESC>
nnoremap <Leader>s' diWi'<C-r>"'<ESC>

nnoremap <Leader>s" diwi"<C-r>""<ESC>
nnoremap <Leader>s" diWi"<C-r>""<ESC>

"map_window.vim
" switch between windows
nmap <C-k> :wincmd k<CR>
nmap <C-j> :wincmd j<CR>
nmap <C-h> :wincmd h<CR>
nmap <C-l> :wincmd l<CR>

"map_yank.vim
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

"mouse.vim
if has('mouse')
  set mouse=a
endif

"Fix bug : mouse before cannot go to 220 char to the right
"This fix it
"https://code.google.com/p/iterm2/issues/detail?can=2&start=0&num=100&q=&colspec=ID%20Type%20Status%20Priority%20Milestone%20Owner%20Summary&groupby=&sort=&id=1830
if has('mouse_sgr')
  set ttymouse=sgr
endif

"run_ruby.vim
" taken inside the demo video https://www.destroyallsoftware.com/screencasts
" it run the current ruby file and display result
map <leader>l :w\|:!ruby %<CR>

"scroll.vim
"show three line before up and down => MAGIC
set scrolloff=3
"show 15 char before and after cursor => MAGIC
set sidescrolloff=15
set sidescroll=1

"search.vim
"""""""""""""
" Searching "
"""""""""""""
set hlsearch
set incsearch
set noignorecase
"Stop search at end of the file
set nowrapscan

" when on a word, it search for this word
" and replace with the specified value
nnoremap <Leader>sr yiw:%s/<C-r>"//gc<Left><Left><Left>
nnoremap <Leader>SR yiW:%s/<C-r>"//gc<Left><Left><Left>

"spell.vim
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

"# Tips and tricks

"## g with norm
"http://briancarper.net/blog/165/
"example:
":g/\d/norm o999

"## Encoding
"http://stackoverflow.com/questions/778069/how-can-i-change-a-files-encoding-with-vim
"Notice that there is a difference between
"set encoding
"and
"set fileencoding

"Donc pour modifier un fichier, faire :
"set fileencoding=utf-8
":wq

"underscorize.vim
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

"up_down_movement.vim
" when go to left at a start of line, it goes to the end of previous
set whichwrap+=<,>,h,l,[,]

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

"use_hexa_editor.vim
"Use vim as HEXA editor :
"open your file as usual
"[esc] :%!xxd
"<now editing mycat in hex>
"<find some innocuous string or rcsid>
"<change the values on the hex side>
"[esc] :%!xxd -r
"[esc] :wq!

"whitespace_stuff.vim
" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Delete all whitespace in end of line
if has("autocmd")
  autocmd BufWritePre * :%s/\s\+$//e
endif

