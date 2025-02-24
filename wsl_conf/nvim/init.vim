" be iMproved
set nocompatible

" do not use this feature
set nomodeline

" https://github.com/junegunn/vim-plug {
call plug#begin('~/.config/nvim/bundle')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " doc https://github.com/nvim-treesitter/nvim-treesitter

Plug 'altercation/vim-colors-solarized'

" Special :Command
Plug 'godlygeek/tabular' " Make multiple things aligned
Plug 'tpope/vim-fugitive' " Gblame, Gremove .... fun
Plug 'tpope/vim-characterize' " Add more display when press ga on a char
Plug 'tpope/vim-vinegar' " better :Explore

" Special map
Plug 'tpope/vim-commentary' " use gcc
Plug 'tpope/vim-rsi' "allow you to use <ctrl-a> as move to left in command mode
Plug 'tpope/vim-surround' " To remove the delimiters entirely to 'Hello world!' press ds'.  Hello world!. or ysiw( . or visual mode then S(
Plug 'tpope/vim-eunuch' "Add unix command like :Remove :Move :SudoWrite
Plug 'tpope/vim-repeat' " Allow to repeat custom map
Plug 'tpope/vim-abolish' " to snake_case (crs), to camelCase (crc) (like javascript), to ruby ModelName MixedCase (crm)
Plug 'gorkunov/smartpairs.vim' " easy select with vv
Plug 'jayflo/vim-skip' " press s and go in midle of line
Plug 'yssl/QFEnter' " Open Quick Fix in previous clicked buffer by pressing <Leader> Enter
Plug 'mbbill/undotree' " do :UndotreeToggle
Plug 'ctrlpvim/ctrlp.vim' " open file ctrl p
Plug 'bronson/vim-trailing-whitespace' " call :FixWhitespace (works with selection too)

Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }
Plug 'echasnovski/mini.icons', { 'branch': 'stable' }

Plug 'MeanderingProgrammer/render-markdown.nvim'

call plug#end()
" }

let g:mapleader = "\<Space>"

" setup var to know wich enironnement is running
let s:uname = system("echo -n \"$(uname)\"")

set history=10000

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
  autocmd BufRead,BufNewFile {Gemfile,CustomGemfile,Rakefile,Vagrantfile,Thorfile,config.ru,Guardfile} setlocal filetype=ruby
  autocmd BufRead,BufNewFile {build.boot} setlocal filetype=clojure
  autocmd BufRead,BufNewFile {.bashrcc,.bashrc_secret,.profilee} setlocal filetype=sh
  autocmd BufNewFile,BufRead Jenkinsfile* setlocal filetype=groovy expandtab
  " add json syntax highlighting
  autocmd BufNewFile,BufRead *.hbs setlocal filetype=html
augroup END

augroup change_txt_behavior
  autocmd!
  " linebreak is to not cut a word in 2 piece
  " autocmd BufNewFile,BufRead  setlocal linebreak ignorecase
  autocmd BufEnter  *             setlocal noignorecase
  autocmd BufEnter  {*.txt,*.md}  setlocal linebreak ignorecase
augroup END

" thanks to http://stackoverflow.com/questions/33093491/vim-gf-with-file-extension-based-on-current-filetype
" it allow 'gf' to work with .jsx files
augroup suffixes
    autocmd!

    let associations = [
                \["javascript", ".js,.javascript,.jsx"],
                \["python", ".py,.pyw"]
                \]

    for ft in associations
        execute "autocmd FileType " . ft[0] . " setlocal suffixesadd=" . ft[1]
    endfor
augroup END
" }

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" file encoding {
set autoread " Automatically reload changes if detected


" Thanks to https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" It automatically reload file (like :e ) when change on windows
" autocmd CursorHold,CursorHoldI * checktime
" autocmd FocusGained,BufEnter * :checktime

" The encoding displayed.
set encoding=utf-8
" The encoding written to file.
set fileencoding=utf-8
" iso-8859-1 is latin1
" set fileencodings=utf-8,iso-8859-1
" }

" QuickLink to various file {
function! OpenInBufferOrVsplit(file)
  if line('$') == 1 && getline(1) == ''
    exec 'e' a:file
  else
    exec 'vsplit' a:file
  endif
endfu

command! SourceVimrc source $MYVIMRC
command! Vimrc :call OpenInBufferOrVsplit("$MYVIMRC")
command! Gvimrc :call OpenInBufferOrVsplit("$MYGVIMRC")
command! Bashrcc :call OpenInBufferOrVsplit("$HOME/.bashrcc")
command! SecretBashrc :call OpenInBufferOrVsplit("$HOME/.bashrc_secret")
command! Profilee :call OpenInBufferOrVsplit("$HOME/.profilee")
command! Tmux :call OpenInBufferOrVsplit("$HOME/.tmux.conf")
command! Ssh :call OpenInBufferOrVsplit("$HOME/.ssh/config")
command! Chiffrage :call OpenInBufferOrVsplit("$POLY_HOME/poly-tim/chiffrages.md")
command! Notes :call OpenInBufferOrVsplit("$POLY_HOME/poly-tim/notes.md")
command! Todos :call OpenInBufferOrVsplit("$POLY_HOME/poly-tim/todos.md")
command! Tickets :call OpenInBufferOrVsplit("$POLY_HOMEly/poly-tim/tickets.md")

" }

" backup swap {
set nobackup "nobk: in this age of version control, who needs it
set nowritebackup "nowb: don't make a backup before overwriting
set noswapfile "noswf: don't litter swap files everywhere
set directory=/tmp "dir: directory for temp files
" }

" colors {
" see help solarized-options :
let g:solarized_termtrans=1 " for transparent terminal capabilities
let g:solarized_termcolors=256 " maximum for console nvim

set background=dark
" colorscheme slate
colorscheme solarized

" stop syntax coloring after n columns
" set synmaxcol=400
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

set lazyredraw "lz: will not redraw the screen while running macros (goes faster)

set virtualedit=block
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
set complete-=i " disable scanning included files - Tim pop says no. So no
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
" cnoremap %% <C-R>=expand("%:p:h") . "/" <CR>
cnoremap %% <C-R>=expand("%:p") <CR>
cnoremap %f <C-R>=expand("%:t") <CR>
inoremap %% <C-R>=expand("%:p") <CR>
inoremap %f <C-R>=expand("%:t") <CR>
nnoremap <F2> a<C-R>=expand("%:p") <CR><esc>
nnoremap <F3> a<C-R>=expand("%:t")<CR><esc>
"taken from https://github.com/carlhuda/janus -> plugin/mappings.vim
nnoremap <F4> :set invpaste<CR>:set paste?<CR>

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

" when on a word, change 'word' to '${word}' (usefull for js)
nnoremap <Leader>sa diwi${<C-r>"}<ESC>
nnoremap <Leader>sA diWi${<C-r>"}<ESC>
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

" Was used before when I automatically erased whitespace
" function! SavePosAndSave()
"    let save_pos = getpos(".")
"    write
"    call setpos(".", save_pos)
" endfu
" nnoremap <Leader><Leader> :call SavePosAndSave()<cr>
nnoremap <Leader><Leader> :write<CR>

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
" do not use nnoremap <Leader>p "_diwP or _diwp because it is inconsistent when end of line
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
  let res = substitute(reg, '^\\V', ''  , '' )
  let res = substitute(res, '\\\\', '\\', 'g')
  let res = substitute(res, '\\n', '\n', 'g')
  return res
endfunction
inoremap <silent> <C-R>/ <C-R>=Del_word_delims()<CR>
cnoremap          <C-R>/ <C-R>=Del_word_delims()<CR>
nnoremap          "/p "=Del_word_delims()<C-M>p

" Needed to use rg
set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m
" Just type :Grep foobar
command! -nargs=+ Grep execute 'silent grep! <args>' | copen 10

" Like * but on all repo :)
" Search what is inside register "/" only words
" ! says to not jump on first occurence.
" -q says to not output stdout but open quickfix list
nnoremap <silent> <Leader>* yiw:silent Ggrep! -q -w "<C-R>""<CR>
" same as previous but no word boundaries
nnoremap <silent> <Leader>/ yiw:silent Ggrep! -q "<C-R>""<CR>
" same as previous on selection
vnoremap <silent> <Leader>/ y:silent Ggrep! -q "<C-R>""<CR>
" pour python
nnoremap <silent> <Leader>j yiw:silent Ggrep! -q "def .*<C-R>""<CR>
" replace \ with /
nnoremap <Leader>\ :s/\\/\//<CR>

" Count selected search
command! Count :%s///gn

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
" https://github.com/ctrlpvim/ctrlp.vim
" Do not update on every key, wait 200 ms
let g:ctrlp_lazy_update = 200
" en mode regex et non pas full lazy
let g:ctrlp_regexp = 1
let g:ctrlp_line_prefix = '  '
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
" autocmd filetype svn,*commit* setlocal spell spelllang=en

" go on top of file on commit
autocmd FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
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
set paste " ne cherche pas à indenter quand on fait un ctrl + v / shift-insert

" make uses real tabs
augroup tab_and_space
  autocmd!
  autocmd FileType make setlocal noexpandtab
  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  autocmd FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4 textwidth=240 expandtab
  autocmd FileType javascript,typescript,json,html,ps1,sh,groovy,gitconfig setlocal tabstop=2 shiftwidth=2 softtabstop=2 nosmarttab expandtab
augroup END

augroup for_projects
  autocmd!
  autocmd FileType javascript,json setlocal path+=src,test
augroup END

" simplify help navigation
" See https://vim.fandom.com/wiki/Learn_to_use_help
" when on a link, press enter
" to go back to previous page, press back
" to go to next/prev link, press s or S
" o / O is for options
augroup for_help
  autocmd!
  autocmd FileType help nnoremap <buffer> <CR> <C-]>
  autocmd FileType help nnoremap <buffer> <BS> <C-T>
  autocmd FileType help nnoremap <buffer> o /'\l\{2,\}'<CR>
  autocmd FileType help nnoremap <buffer> O ?'\l\{2,\}'<CR>
  autocmd FileType help nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
  autocmd FileType help nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>
augroup END

let g:projectionist_heuristics = {
   \   "src/fti-main.js": {
   \     "README.md": {"type": "doc"},
   \     "src/domain-models/*.js": { "type": "domainModel" },
   \     "src/helpers/*.js": { "type": "helpers" },
   \     "src/constants/*.js": { "type": "constants" },
   \     "src/locale/*.js": { "type": "locale" },
   \     "src/services/*.js": { "type": "services" },
   \     "src/shared/*.js": { "type": "shared" },
   \     "src/views/*.js": { "type": "views" },
   \     "src/*.js": {
   \       "alternate": "test/unit/{}.spec.js",
   \       "type": "source"
   \     },
   \     "test/unit/*.spec.js": {
   \       "alternate": "src/{}.js",
   \       "type": "test"
   \     }
   \   },
   \   "angular.json": {
   \     "README.md": {"type": "doc"},
   \     "src/app/*.component.html": {
   \       "type": "view",
   \       "alternate": "src/app/{}.component.ts",
   \       "related": "src/app/{}.component.spec.ts"
   \     },
   \     "src/app/*.component.ts": {
   \       "type": "component",
   \       "alternate": "src/app/{}.component.html",
   \       "related": "src/app/{}.component.spec.ts"
   \     },
   \     "src/app/*.module.ts": {
   \       "type": "module",
   \       "alternate": "src/app/{}.component.ts"
   \     },
   \     "src/app/*.service.ts": {
   \       "type": "service",
   \       "alternate": "src/app/{}.service.spec.ts"
   \     },
   \     "src/app/*.component.scss": {
   \       "type": "css",
   \       "alternate": "src/app/{}.component.ts"
   \     },
   \     "src/app/shared/*.ts": { "type": "shared" },
   \     "src/app/*.ts": {
   \       "alternate": "src/app/{}.spec.ts"
   \     },
   \     "src/app/*.spec.ts": {
   \       "alternate": "src/app/{}.ts",
   \       "type": "test"
   \     }
   \   },
   \   "services/quantumPlugin.service.js": {
   \     "*.js": {
   \       "type": "all",
   \       "alternate": "{}.test.js"
   \     },
   \     "redux/reducers/*.js": {
   \       "type": "reducers",
   \       "alternate": "redux/reducers/{}.test.js"
   \     },
   \     "redux/types/*.js": {
   \       "type": "types",
   \       "alternate": "redux/types/{}.test.js"
   \     },
   \     "constants/*.js": {
   \       "type": "constants",
   \       "alternate": "constants/{}.test.js"
   \     },
   \     "components/*.js": {
   \       "type": "components",
   \       "alternate": "components/{}.test.js"
   \     },
   \     "containers/*.js": {
   \       "type": "containers",
   \       "alternate": "containers/{}.test.js"
   \     },
   \     "helpers/*.js": {
   \       "type": "helpers",
   \       "alternate": "helpers/{}.test.js"
   \     },
   \     "models/*.js": {
   \       "type": "models",
   \       "alternate": "models/{}.test.js"
   \     },
   \     "*.test.js": {
   \       "alternate": "{}.js",
   \       "type": "test"
   \     }
   \   },
   \   "src/App.js": {
   \     "*.js": {
   \       "type": "all",
   \       "alternate": "{}.test.js"
   \     },
   \     "*.test.js": {
   \       "type": "all",
   \       "alternate": "{}.js"
   \     },
   \   },
   \ }

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

nnoremap <silent> <C-k> :call WinMove('k')<cr>
nnoremap <silent> <Leader><Up> :call WinMove('k')<cr>

nnoremap <silent> <C-j> :call WinMove('j')<cr>
nnoremap <silent> <Leader><Down> :call WinMove('j')<cr>

nnoremap <silent> <C-h> :call WinMove('h')<cr>
nnoremap <silent> <Leader><Left> :call WinMove('h')<cr>

nnoremap <silent> <C-l> :call WinMove('l')<cr>
nnoremap <silent> <Leader><Right> :call WinMove('l')<cr>

" Switch directly to the new splitted window
nnoremap <C-w>v :vsplit<CR>
nnoremap <C-w>s :split<CR>

" split under
set splitbelow
" split right
set splitright
" }

" syntastic {
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_python_checkers = ['pylint']
" " Always open loc list
" let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1
" let g:syntastic_javascript_checkers = ['eslint']
" " let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
" " need npm install -g eslint_d
" let g:syntastic_javascript_eslint_exec = 'eslint_d'
" let g:syntastic_javascript_eslint_args = "--no-eslintrc --config ~/.eslintrc"

" Special for python
nnoremap <Leader>t :!python -m pytest tests/<CR>
" si celle la est trop compliqué prendre celle en haut
nnoremap <Leader>T :set makeprg=python\ -m\ pytest\ tests/ <CR>:silent make<CR>:copen<CR>
nnoremap <Leader>w :FixWhitespace<CR>
nnoremap <Leader>l :lafter<CR>
nnoremap <Leader>L :lbefore<CR>

""" FORMATTING
" special for formation
" nnoremap <Leader>f mz:%!npx prettier --no-color --stdin-filepath %<CR>'z

" f for fix, t for test, w whitespace, l pour location list
" mf -> mark line at z
" 'z -> go to z
nnoremap <Leader>f mz:%!black - -q<CR>'z

" format the entire file,
" mf   -> mark line inside f,
" gg=G -> reindent,
" 'f   -> go to current line
nnoremap <Leader>= mfgg=G'f
" }


" To open error list run :lopen
" let g:ale_linters = {
" \  'javascript': ['eslint'],
" \  'json': ['prettier'],
" \  'html': ['prettier'],
" \  'typescript': ['prettier'],
" \  'python': ['pylint'],
" \}
" let g:ale_fixers = {
" \  'javascript': ['prettier', 'eslint'],
" \  'css': ['prettier'],
" \  'json': ['prettier'],
" \  'html': ['prettier'],
" \  'typescript': ['prettier'],
" \  'python': ['black'],
" \}
" let g:ale_open_list = 1
" let g:ale_python_black_executable = 'python -m black'
" let g:ale_python_pylint_executable = 'python -m pylint'


" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '>'
" let g:ale_fix_on_save= 1
" let g:ale_set_highlights = 0
" let g:ale_lint_on_text_changed = 0
" let g:ale_lint_on_enter = 0
" let g:ale_lint_on_insert_leave = 0
" always open
" let g:ale_open_list = 1
" let g:ale_sign_column_always = 1

" sudo {
" Allow saving of files as sudo when I forgot to start vim using sudo.
" or :SudoEdit
cabbrev w!! w !sudo tee > /dev/null %
" }

" tpope vinegar{
let g:netrw_liststyle=3
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
autocmd FilterWritePre * if &diff | set syntax=off | endif
" }

" n always go bottom, N up. Took here  https://github.com/mhinz/vim-galore/blob/master/README.md#saner-behavior-of-n-and-n
nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]

" take here : https://github.com/mhinz/vim-galore/blob/master/README.md#saner-ctrl-l
" do: redraw!, de-highlighting search, fixing syntax highlighting, force updating the syntax highlighting in diff mode:
nnoremap <F5> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" https://github.com/mhinz/vim-galore/blob/master/README.md#quickly-edit-your-macros
" Simply edit your macro
" How to use :
" record a macro in reg a : qa ......
" then to edit press : "a<Leader>q
" press enter after editing
nnoremap <Leader>q  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" Avoid 'press enter' on scp
" set cmdheight=2
let g:netrw_silent=1

" More colors
" taken from https://github.com/tpope/vim-sensible
" if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
"   set t_Co=16
" endif

" Move to the previous {
" Also works with ( using [(
nnoremap <Leader>B [{
" Move to the closing }
" Also works with ) using ])
nnoremap <Leader>b ]}

" taken from https://vi.stackexchange.com/a/456
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

command! TrimWhitespace call TrimWhitespace()
"noremap <Leader>w :call TrimWhitespace()<CR>



lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { 
     "c", "lua", "vim", "vimdoc", "bash", "cpp", "java", "clojure",
     "query", "markdown", "markdown_inline", "javascript", "python",
     "json", "git_config","git_rebase", "gitcommit", "gitignore"
},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,

    disable = function(lang, buf)
        local max_filesize = 1000 * 1024 -- 1 MB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
  },
  additional_vim_regex_highlighting = false,
  indent = {
    enable = true
  },

}
EOF

" configure folding {
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=50

" unfold/fold everythings
nnoremap ZA :set invfoldenable<CR>
" }



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
"
" When working with windows file
" http://stackoverflow.com/questions/3852868/how-to-make-vim-show-m-and-substitute-it
"
" Display CRLF as ^M:
" :e ++fileformat=unix
"
" Substitute CRLF for LF:
" :setlocal fileformat=unix
" :w
" :e
" }
"
" ## to automatialy fix eslint, reload file, go back to previous 'manual' eslint
" :let g:syntastic_javascript_eslint_args = ['--fix'] | w | e | let g:syntastic_javascript_eslint_args = ['']
"

" ## to reload file after eslint do his work
" http://vi.stackexchange.com/questions/8381/how-to-auto-fix-common-linting-errors-reported-via-syntastic
"
" ## vim-fugitive how to do a 3 way merge
" http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/
" Open a file with merge conflict
" do
" :Gdiffsplit!
"
" Then, go on what you want, do 'dp' -> diffput
" Then it will move your focused dp in the middle
" then you will be able to again compare with the left part :D
" ENJOY
