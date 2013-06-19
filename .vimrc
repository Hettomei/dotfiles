set nocompatible               " be iMproved
filetype off                   " required!

let mapleader = ","
if has('mouse')
  set mouse=a
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-markdown'
Bundle 'godlygeek/tabular'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'ervandew/supertab'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'gudleik/vim-slim'
Bundle 'tpope/gem-ctags'

set number
syntax on
set autoread " Automatically reload changes if detected
set ruler
set encoding=utf8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" Status bar
set laststatus=2

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif


" CTags
"map <Leader>rt :!/usr/local/bin/ctags --extra=+f -R *<CR><CR>
"map <C-\> :tnext<CR>

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,Guardfile}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupWrapping()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript
au BufRead,BufNewFile *.txt call s:setupWrapping()

" Yaml Configuration
au BufRead,BufNewFile *.{yml,yaml} set foldmethod=indent

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Use modeline overrides
set modeline
set modelines=10

set cursorline

" Default color scheme
color default

" Show (partial) command in the status line
set showcmd
" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" Patter ignore when use the completion in search file
set wig=*.o,*.obj,*~,#*#,*.pyc,*.tar*,*.avi,*.ogg,*.mp3

" No save backup by .swp
set nowb
set noswapfile
set noar

" Delete all whitespace in end of line
autocmd BufWritePre * :%s/\s\+$//e

set foldmethod=syntax
set foldlevel=3

let g:Powerline_symbols = 'fancy'
set t_Co=256

let Tlist_Auto_Update = 'true'
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

"spell check when writing commit logs
autocmd filetype svn,*commit* set spell

let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.hg$\|\.svn$\',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': 'some_bad_symbolic_links',
\ }

"show three line before up and down => MAGIC
set scrolloff=3
" when go to left at a start of line, it goes to the end of previous
set whichwrap+=<,>,h,l,[,]
" "*y Copy to 'clipboard registry'
" Work like 'y' but copy in OS clipboard (géniaaaal !!)
" Dont use nmap because we need in vmap
" Don't use noremap because it not understand << Y$ >>
map Y "*y
nmap YY ^"*y$
"Display &nbsp and trailing space :
set list listchars=nbsp:•,trail:¬

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

" Yank the word on which i am
nmap <Leader>y yiw
" Yank the word on which i am and put it in the clipboard
nmap <Leader>Y "*yiw
" Remove the word under the cursor and go in insert mode
nmap <Leader>r ciw
" when on a word, change 'word' to '#{word}' (usefull for ruby)
" Leader a , with a like accolade
nmap <Leader>a diWi#{<ESC>pli}<ESC>
"Move screen to the left or to the right
map <C-L> zl
map <C-H> zh
"when use x, do not send to test register <""> but send to black hole
"register "_ (ie void, or /dev/null or divide by 0...), <dl> is = <x>
nmap x "_dl
vmap x "_dl
""_diw -> select word and delete it in black hole, then paste
nnoremap <Leader>p "_diwP
nnoremap <Leader>P "_diwp
nnoremap ZA :set foldlevel=10<CR>
nnoremap ZB :set foldlevel=1<CR>

"""""""""""""""
" TIP & TRICK "
"""""""""""""""
"To search with case sensitive,   tap :set ic
"To search with case insensitive, tap :set noic
"Be carefull because with janus, if search as ONE upper case it search case
"sensitive
"finally it s a good things
set noic

"when press <Leader>sr it search and replace word under cursor
"yiw yank the word under cursor
"<C-r>0 paste the last yanked word
" need a lot of improvment like when wanted to change http://test/to the "/"
" is bad...
"nmap <Leader>sr yiw:%s/<C-r>0/<C-r>0/gc<Left><Left><Left>
"Change as function -SearchAndReplace- BETTER
function! SearchAndReplace()
  " expand("<cword>") -> word under cursor
  let word_to_search = expand("<cword>")
  let word_to_replace = input("Replace with : ", word_to_search)
  execute "%s/".word_to_search."/".word_to_replace."/gc"
endfunction
nnoremap <Leader>sr :call SearchAndReplace()<CR>
"Stop search at end of the file
set nowrapscan

"taken from https://github.com/carlhuda/janus -> plugin/mappings.vim
nnoremap <F4> :set invpaste<CR>:set paste?<CR>
" format the entire file
nnoremap <leader>fef ggVG=
nnoremap <C-$> <C-]>

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" taken inside the demo video https://www.destroyallsoftware.com/screencasts
" it run the current ruby file and display result
map <leader>l :w\|:!ruby %<CR>
nmap ,col :set invcursorcolumn<CR>
" insert newline
map <CR> o<ESC>
map <S-CR> O<ESC>

ab ### <CR># Public: Duplicate some text an arbitrary number of times.
\<CR>#
\<CR># text  - The String to be duplicated.
\<CR># count - The Integer number of times to duplicate the text.
\<CR>#
\<CR># Examples
\<CR>#
\<CR>#   multiplex("Tom", 4)
\<CR>#   # => "TomTomTomTom"
\<CR>#
\<CR># Returns the duplicated String.

"""""""""" Rails :

"can remove this
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
nnoremap ,vlang :tabnew config/locales/en.yml<CR>:vsplit config/locales/fr.yml<CR>

"Use vim spell:
" zg Add word under the cursor as a good word_to_search
" zw Mark the word as a wrong (bad) word.wrong
" z= For the word under/after the cursor suggest correctly
" spelled words.
"

"Use vim as HEXA editor :
"open your file as usual
"[esc] :%!xxd
"<now editing mycat in hex>
"<find some innocuous string or rcsid>
"<change the values on the hex side>
"[esc] :%!xxd -r
"[esc] :wq!


"For vim-rails
"replace :
"autocmd User Rails Rnavcommand fabricator spec/fabricators -suffix=_fabricator.rb -default=model()
"with:
"help -> :help rails-projection
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
