" be iMproved
set nocompatible

" required!
filetype off

" Vundle {
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin("~/.config/nvim/bundle")

Plugin 'VundleVim/Vundle.vim'
Plugin 'godlygeek/tabular' " Make multiple things aligned
Plugin 'scrooloose/syntastic'
Plugin 'gorkunov/smartpairs.vim' " make easy with vv
" Plugin 'Konfekt/FastFold' " Fix very slow vim because of foldmethod=syntax

" tpope
Plugin 'tpope/vim-fugitive' " Gblame, Gremove .... fun
Plugin 'tpope/vim-commentary' " use gcc
Plugin 'tpope/vim-rsi' "allow you to use <ctrl-a> as move to left in command mode
Plugin 'tpope/vim-surround' " To remove the delimiters entirely to 'Hello world!' press ds'.  Hello world!. or ysiw( . or visual mode then S(
Plugin 'tpope/vim-eunuch' "Add unix command like :Remove :Move :SudoWrite
Plugin 'tpope/vim-projectionist' " Allow to use :A on any project
Plugin 'tpope/vim-bundler' " add gf on Gemfile to open gem source
Plugin 'tpope/vim-rake' " Need vim-projectionist ta add a :A for alternative file
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-characterize' " Add more display when press ga on a char
Plugin 'tpope/vim-repeat' " Allow to repeat custom map
" Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
" to snake_case (crs), to camelCase (crc) (like javascript), to ruby ModelName MixedCase (crm)
Plugin 'tpope/vim-abolish' " https://github.com/tpope/vim-abolish#coercion easily convert to snake_Case to CamelCase ... \o/ ;
Plugin 'tpope/vim-vinegar' " better explorer :e ..

Plugin 'jayflo/vim-skip' " press s and go in midle of line
Plugin 'altercation/vim-colors-solarized'

" language specific
Plugin 'pangloss/vim-javascript'
Plugin 'vim-ruby/vim-ruby'
Plugin 'lmeijvogel/vim-yaml-helper' " go to key and press :YamlGetFullPath
Plugin 'msanders/snipmate.vim'

" Lisp :
" Plugin 'kovisoft/slimv'

" Clojure
" Plugin 'guns/vim-clojure-static'
" Plugin 'tpope/vim-salve'
" Plugin 'tpope/vim-dispatch'
" Plugin 'tpope/vim-fireplace'

" for opening file using ... ctrl p
Plugin 'kien/ctrlp.vim'
" Open Quick Fix in previous clicked buffer by pressing <Leader> Enter
Plugin 'yssl/QFEnter'

call vundle#end()            " required
" load the plugin and indent settings for the detected filetype
filetype plugin indent on    " required
" }

let g:mapleader = "\<Space>"

" setup var to know wich enironnement is running
let s:uname = system("echo -n \"$(uname)\"")

set history=4000

" taken here : https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/.vimrc
"           +--Disable hlsearch while loading viminfo
"           | +--Remember marks for last 50 files
"           | |   +--Remember up to 1000 lines in each register
"           | |   |      +--Remember up to 1MB in each register
"           | |   |      |     +--Remember last 500 search patterns
"           | |   |      |     |     +---Remember last 1000 commands
"           | |   |      |     |     |
"           v v   v      v     v     v
set viminfo=h,'50,<1000,s1000,/500,:2000


" FileType {
" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
augroup change_file_type
  autocmd!
  autocmd BufRead,BufNewFile {Gemfile,CustomGemfile,Rakefile,Vagrantfile,Thorfile,config.ru,Guardfile} set filetype=ruby
  " add json syntax highlighting
  autocmd BufNewFile,BufRead *.json set filetype=javascript
  autocmd BufNewFile,BufRead *.hbs set filetype=html
augroup END
" }

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" file encoding {
set autoread " Automatically reload changes if detected
" The encoding displayed.
set encoding=utf-8
" The encoding written to file.
set fileencoding=utf-8
set fileencodings=utf-8
" }

" QuickLink to various file {
function! OpenInBufferOrTab(file)
  if line('$') == 1 && getline(1) == ''
    exec 'e' a:file
  else
    exec 'tabnew' a:file
  endif
endfu

command! Vimrc :call OpenInBufferOrTab("$MYVIMRC")
command! SourceVimrc source $MYVIMRC
command! Gvimrc :call OpenInBufferOrTab("$MYGVIMRC")
command! Bashrc :call OpenInBufferOrTab("$HOME/.bashrc")
command! Todo :call OpenInBufferOrTab("$HOME/todo.md")
command! Fait :call OpenInBufferOrTab("$HOME/fait.md")
command! Tmux :call OpenInBufferOrTab("$HOME/.tmux.conf")
" }

" backup swap {
set nobackup "nobk: in this age of version control, who needs it
set nowritebackup "nowb: don't make a backup before overwriting
set noswapfile "noswf: don't litter swap files everywhere
set directory=/tmp "dir: directory for temp files
" }

" colors {
" let g:solarized_termtrans=1 " need to add this light to have a decent render on linux
" let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized

" stop syntax coloring after 1000 columns
set synmaxcol=400
" }

" CTags ctags {
" let Tlist_Auto_Update=1
" let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
" Reload tag
" command! Rtags execute "!/usr/local/bin/ctags --extra=+f -R *"
" ctags -R --languages=ruby --exclude=.git --exclude=log .
nnoremap <C-$> :tnext<CR>
" }

" configure display {
set statusline=%y%f%=%m%r%h%w\ %l\/%L\ \|\ %c

" Status bar
set laststatus=2

set cursorline

" Show (partial) command in the status line
set showcmd

" Suppress mode change messages
set noshowmode

" allow to display other char than tab or eol ... also it display tab as ^I.
" To stop that : set invlist
set list
"Display &nbsp and trailing space : , works only when set list
set listchars=nbsp:•,trail:¬,tab:→→

" line number
set number
set numberwidth=1

" set ttyfast "tf: improves redrawing for newer computers
set lazyredraw "lz: will not redraw the screen while running macros (goes faster)

set virtualedit=block

set title
" }

" configure folding {
if &diff
  set foldmethod=diff
else
  set foldmethod=syntax foldlevel=10
endif

augroup change_file_fold
  autocmd!
  autocmd BufRead,BufNewFile *vimrc                        setlocal foldmethod=marker foldmarker={,} foldlevel=5
  autocmd BufRead,BufNewFile *.scss,*.less                 setlocal foldmethod=marker foldmarker={,} foldlevel=6
  autocmd BufRead,BufNewFile *.{yml,yaml,slim,haml,coffee} setlocal foldmethod=indent
augroup END

" If you prefer that folds are only updated manually (pressing zuz) but not when saving the buffer
let g:fastfold_savehook = 0
let g:tex_fold_enabled=1
let g:vimsyn_folding='af'
let g:xml_syntax_folding = 1
let g:ruby_fold_enabled=1
let g:javascript_fold_enabled=1
" }

" configure ruby{
" augroup config_ruby
"   autocmd!
  " Said it is a good practice to do -= then += but can't find link
  " autocmd FileType ruby setlocal iskeyword-=?,! iskeyword+=?,!
  " with @ as part of a word
  " set iskeyword-=-,?,@-@ iskeyword+=-,?,@-@
" augroup END
" }

" configure ruby{
" augroup config_clojure
"   autocmd!
  " Said it is a good practice to do -= then += but can't find link
  " autocmd FileType clojure setlocal iskeyword-=:
  " with @ as part of a word
  " set iskeyword-=-,?,@-@ iskeyword+=-,?,@-@
" augroup END
" }

" configure html/javascript{
augroup config_html_css_js
  autocmd!
  autocmd FileType html,javascript,eruby,css,scss setlocal iskeyword-=-,$ iskeyword+=-,$
augroup END
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
    autocmd!
    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload undolevels=-1 | else | set eventignore-=FileType | endif
  augroup END
endif
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
      \ "spec/factories/*.rb": {
      \   "command": "factory",
      \   "template":
      \     "FactoryGirl.define do\nfactory :%s, class: %S do\nend\nend",
      \   "test": [
      \     "spec/models/%s_spec.rb"
      \   ],
      \ },
      \ "app/repositories/*_repository.rb": {
      \   "command": "repository",
      \   "template":
      \     "class %SRepository\nend",
      \   "test": [
      \     "spec/repositories/%s_repository_spec.rb"
      \   ],
      \ },
      \ "app/presenter/*.rb": {
      \   "command": "presenter",
      \   "template":
      \     "class %S\nend",
      \   "test": [
      \     "spec/presenter/%s_spec.rb"
      \   ],
      \ },
      \ "app/runner/*.rb": {
      \   "command": "runner",
      \   "template":
      \     "class %S\nend",
      \   "test": [
      \     "spec/runner/%s_spec.rb"
      \   ],
      \ },
      \ "app/forms/*_form.rb": {
      \   "command": "form",
      \   "template":
      \     "class %Form\nend",
      \   "test": [
      \     "spec/forms/%s_form_spec.rb"
      \   ],
      \ },
      \ "features/support/*.rb": {"command": "support"},
      \ "features/support/env.rb": {"command": "support"}
      \}
" }

" snipmate {
let g:snippets_dir=globpath(&runtimepath, 'my_snippets')
" }

" tabularize {
" see .vim/after/plugin/my_tabular.vim
" }

" wildignore {
" vim-scripts/gitignore update the list too
" Pattern ignore when use the completion in search file
set wildignore+=*.o,*.obj,*~,#*#,*.pyc,*.tar*,*.avi,*.ogg,*.mp3,*.ico
set wildignore+=.git,*.rbc,*.class,.svn,vendor/gems/*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*.tmp,*.so,*.swp,*.zip,*.exe
" case-insensitive filename completion
set wildignorecase
" }

" Completion {
" Completion like bash
" menuone is to always display menu
set completeopt+=longest,menuone
"tab completion for files
set wildmode=list:longest
set dictionary=/Users/tim/.vim/dictionary/francais.txt
set complete-=i " Tim pop says no. So no
" Add dictionnary to <Ctrl-N> " will see if usefull in futur
"set complete-=k complete+=k
" }

" Remember last location in file {
augroup lastlocation
  autocmd!
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
augroup END
" }

" map other {

"open the same directory as the current buffer !
nnoremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
"display the same directory as the current buffer !
cnoremap %% <C-R>=expand("%:p:h") . "/" <CR>
cnoremap %f <C-R>=expand("%:t") <CR>
nnoremap <F2> a<C-R>=expand("%:p:h") . "/" <CR><esc>
nnoremap <F3> a<C-R>=expand("%:t")<CR><esc>

"taken from https://github.com/carlhuda/janus -> plugin/mappings.vim
nnoremap <F4> :set invpaste<CR>:set paste?<CR>

" format the entire file,
" mf   -> mark line inside f,
" gg=G -> reindent,
" 'f   -> go to current line
nnoremap <Leader>f mfgg=G'f

"display cursor column
nnoremap <Leader>col :set invcursorcolumn<CR>

"Cut line where cursor is
"Probleme when buffer is unmodifiable :/
" nnoremap <ENTER> r<ENTER>


" like gt (tab next) but with buffer
nnoremap gb :bn<CR>
nnoremap gB :bp<CR>

" }

" map surround {

" when on a word, change 'word' to '#{word}' (usefull for ruby)
nnoremap <Leader>sa diwi#{<C-r>"}<ESC>
nnoremap <Leader>sA diWi#{<C-r>"}<ESC>
" }

" yank copy mapping {

" "+y Copy to 'clipboard registry'
" Work like 'y' but copy in OS clipboard (géniaaaal !!)
" Dont use nmap because we need in vmap
" Don't use noremap because it not understand << Y$ >>
" save in clipboard
vnoremap Y "+y

" all this function just to ensure cursor didn't move
" before I used : i<esc>l`^ , but on readonly file it failed because 'i' is forbidden
function! SavePosAndDo(str)
   let save_pos = getpos(".")
   execute "normal! " . a:str
   call setpos(".", save_pos)
endfu
" put in os clipboard
nnoremap <Leader>Y :call SavePosAndDo('"+yiw')<cr>
" put word in clipboard and go back to previous pos
nnoremap <Leader>y :call SavePosAndDo('yiw')<cr>

" save all line in clipboard
nnoremap YY :call SavePosAndDo('^"+y$')<cr>

function! SavePosAndSave()
   let save_pos = getpos(".")
   write
   call setpos(".", save_pos)
endfu
nnoremap <Leader><Leader> :call SavePosAndSave()<cr>

" Make Y behave like C and D.
" taken from https://github.com/tpope/vim-sensible
nnoremap Y y$
" }

" paste mapping {
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
" replace current word with paste and do not save deleted word to register
nnoremap <Leader>p "_ciw<C-r>"<esc>
"http://vim.wikia.com/wiki/Selecting_your_pasted_text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
" }

" delete mapping {
"when use x, do not send to test register <""> but send to black hole
"register "_ (ie void, or /dev/null or divide by 0...)
nnoremap x "_x
nnoremap X "_X
vnoremap x "_x
vnoremap X "_X

" delete the word on which i am
nnoremap <Leader>d diw
" delete the word on which i am and put it in the clipboard
nnoremap <Leader>D "+diw

" Remove the word under the cursor
" Do not save the word in any register
" and go in insert mode
nnoremap <Leader>r "_ciw

" }

" movement mapping {
" Delete yank or change until next Majuscule
" o waits for you to enter a movement command : http://learnvimscriptthehardway.stevelosh.com/chapters/15.html
" M is for Maj
" :<c-u>execute -> special way to run multiple normal commande in a map : learnvimscriptthehardway.stevelosh.com/chapters/16.html
" onoremap M :<c-u>execute "normal! /[A-Z]\r:nohlsearch\r"<cr>
onoremap M :<c-u>execute "normal! /[A-Z]\r"<cr>
" }

" Move visual block {
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" }

" mouse {
if has('mouse')
  set mouse=a
endif
" }

" run ruby {
" taken inside the demo video https://www.destroyallsoftware.com/screencasts
" it run the current ruby file and display result
nnoremap <Leader>l :w\|:!ruby %<CR>
" }

" scroll {
"show three line before up and down => MAGIC
set scrolloff=3
"show 15 char before and after cursor => MAGIC
set sidescrolloff=15
set sidescroll=1
" }

" search {
set incsearch "is: automatically begins searching as you type
set noignorecase "ic: no ignores case
set hlsearch "hls: highlights search results; ctrl-n or :noh to unhighlight
set gdefault "gd: Substitute all matches in a line by default no need s/a/b/g
set nowrapscan "Stop search at end of the file

" search for selected text
" TODO not working perfectly
vnoremap // y/\V<C-R>"<CR>

" when on a word, it search for this word
" and replace with the specified value
nnoremap <Leader>sr :%s/\<<C-r><C-w>\>/
nnoremap <Leader>sR :%s/<C-r><C-w>/
vnoremap <Leader>sr y:%s/\V<C-r>"/
" Show effects of the command as you type. (:s only for now)
set inccommand=split

" remove ugly char when pasted searched text
function! Del_word_delims()
  let reg = getreg('/')
  " After *  i^r/ will give me pattern instead of \<pattern\>
  let res = substitute(reg, '^\\<\(.*\)\\>$', '\1', '' )
  if res != reg
    return res
  endif
  " After * on a selection i^r/ will give me pattern instead of \Vpattern
  let res = substitute(reg, '^\\V'          , ''  , '' )
  let res = substitute(res, '\\\\'          , '\\', 'g')
  let res = substitute(res, '\\n'           , '\n', 'g')
  return res
endfunction
inoremap <silent> <C-R>/ <C-R>=Del_word_delims()<CR>
cnoremap          <C-R>/ <C-R>=Del_word_delims()<CR>
nnoremap          "/p "=Del_word_delims()<C-M>p

" The Silver Searcher
" thanks to https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ -Q\ --nogroup\ --nocolor\ --case-sensitive\ --path-to-ignore\ $HOME/.agignorecustom
endif

" Like * but on all repo :)
" call histadd("cmd", "e $MYVIMRC")
"
" Search what is inside register "/" only words
nnoremap <silent> <Leader>* :grep! -w "<C-R>=Del_word_delims()<CR>"<CR>:cw<CR>
" Search what is inside register "/" but on all repo
nnoremap <silent> <Leader>/ :grep! "<C-R>=Del_word_delims()<CR>"<CR>:cw<CR>
" Search what is selected on all repo
vnoremap <silent> <Leader>/ y:exe "grep! " . shellescape("<C-r>0")<CR><CR>:cw<CR>

augroup specific-quickfix-window
  autocmd!
  " Always move quickfix at bottom for full width
  autocmd FileType qf wincmd J
  " Quit on q
  autocmd FileType qf nnoremap <buffer> q :q<CR>
  " Open new window
  " display quickfix window on bottom
  " and return on the previous opened window
  autocmd FileType qf nnoremap <buffer> <C-h> <C-w><Enter><C-w>H:cclose<CR>:copen<CR><C-w>p
  autocmd FileType qf nnoremap <buffer> <C-j> <C-w><Enter><C-w>J:cclose<CR>:copen<CR><C-w>p
  autocmd FileType qf nnoremap <buffer> <C-k> <C-w><Enter><C-w>K:cclose<CR>:copen<CR><C-w>p
  autocmd FileType qf nnoremap <buffer> <C-l> <C-w><Enter><C-w>L:cclose<CR>:copen<CR><C-w>p
  " Open in a new tab. ^ is to go to first char to apply "gf"
  autocmd FileType qf nnoremap <buffer> <C-t> ^<C-w>gf:copen<CR><C-w>p
augroup END
" }

" ctrlp {
"https://github.com/kien/ctrlp.vim
nnoremap <C-b> :CtrlPBuffer<CR>

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" }

" spell {
" Use vim spell:
" :set spelllang=fr
" :set spell
"
" z= For the word under/after the cursor suggest correctly
" zg Add word under the cursor as a good word_to_search
" zw Mark the word as a wrong (bad) word.

"spell check when writing commit logs
autocmd filetype svn,*commit* setlocal spell spelllang=en

" go on top of file on commit
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
" }

" up down movement {
" when go to left at a start of line, it goes to the end of previous
set whichwrap+=<,>,h,l,[,]

" Map the arrow keys to be based on display lines, not physical lines
nnoremap <Down> gj
nnoremap <Up> gk
" }

" Whitespace space tab stuff {
set nowrap
set tabstop=2 "ts: number of spaces that a tab renders as
set shiftwidth=2 "sw: number of spaces to use for autoindent
set softtabstop=2 "sts: number of spaces that tabs insert
" set smarttab "sta: helps with backspacing because of expandtab, A <BS> will delete a 'shiftwidth' worth of space at the start of the line.
set nosmarttab
set expandtab "et: uses spaces instead of tab characters

" make uses real tabs
augroup tab_and_space
  autocmd!
  autocmd FileType make setlocal noexpandtab
  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  autocmd FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79 noexpandtab

  " Delete all trailing whitespace in end of line
  autocmd BufWritePre * :%s/\s\+$//e
augroup END
" }

" move in window stuff {
" ----------------------------------------------------------------------------
" move to the window in the direction shown, or create a new split in that
" direction
" ----------------------------------------------------------------------------
func! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfu

nnoremap <silent> <C-h> :call WinMove('h')<cr>
nnoremap <silent> <C-j> :call WinMove('j')<cr>
nnoremap <silent> <C-k> :call WinMove('k')<cr>
nnoremap <silent> <C-l> :call WinMove('l')<cr>

" Switch directly to the new splitted window
nnoremap <C-w>v :vsplit<CR>
nnoremap <C-w>s :split<CR>

nnoremap <silent> <Leader>j :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>k :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>h :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>l :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" split under
set splitbelow
" split right
set splitright
" }

" syntastic {
if !v:shell_error && s:uname == "Linux"
  " let g:syntastic_mode_map = { 'mode': 'passive' }
else
  let g:syntastic_ruby_exec = '/usr/local/opt/rbenv/versions/2.1.5/bin/ruby'
endif

let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
" Always open loc list
" let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_args = "--no-eslintrc --config ~/.eslintrc"
" }

" special teezily {
if !v:shell_error && s:uname == "Linux"
  nnoremap <PageDown> <Nop>
  inoremap <PageDown> <Nop>
  nnoremap <PageUp> <Nop>
  inoremap <PageUp> <Nop>
  nnoremap <Del> <Nop>

  abbrev FP FreePeriod
endif

" Convert new hash a: 4 to old hash :a => 4
" oh is for old hash
nnoremap <Leader>oh :s/\([a-z_]\+\): /:\1 => <CR>

" }

" sudo {
" Allow saving of files as sudo when I forgot to start vim using sudo.
" or :SudoEdit
cabbrev w!! w !sudo tee > /dev/null %
" }

" tpope vinegar{
let g:netrw_liststyle=3
nmap <Leader>n <Plug>VinegarUp
" keep - the old way because tpope remapped it
nnoremap - -
" }
"
" terminal {
tnoremap <Esc> <C-\><C-n>
" }

" SLIME {
" to run it, open a .lisp file then press ,e

" Disable enclosing parenthesis
" let g:paredit_mode=0
let g:lisp_rainbow=1
" }

" open :help vertically {
autocmd FileType help wincmd L
" }

" QFEnter {
let g:qfenter_open_map = ['<Leader><CR>']
let g:qfenter_vopen_map = ['<Nop>']
let g:qfenter_hopen_map = ['<Nop>']
let g:qfenter_topen_map = ['<Nop>']
" }

" when in diff mode, no color {
au FilterWritePre * if &diff | set syntax=off | endif
" }
"
" Tips and tricks {

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
"
" ## use hexa editor
"Use vim as HEXA editor :
"open your file as usual
"[esc] :%!xxd
"<now editing mycat in hex>
"<find some innocuous string or rcsid>
"<change the values on the hex side>
"[esc] :%!xxd -r
"[esc] :wq!
"
" ## To add an abbrev for a specifiq filetype :
" autocmd FileType javascript :iabbrev <buffer> cl console.log();<left><left>
"
" Why I group autocmd ? (because to reload vimrc)
" http://learnvimscriptthehardway.stevelosh.com/chapters/14.html<F37>

" To profile all
" :profile start profile.log
" :profile func *
" :profile file *
" :profile pause
" :profile continue
" :q
"
" search count
" :%s/pattern//gn
" }
