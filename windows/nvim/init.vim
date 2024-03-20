let g:mapleader = "\<Space>"

set mouse=a
" do not loop search at end of file
set nowrapscan
" do not wrap text
set nowrap
set gdefault "gd: Substitute all matches in a line by default no need s/a/b/g

" backup swap {
set nobackup "nobk: in this age of version control, who needs it
set nowritebackup "nowb: don't make a backup before overwriting
set noswapfile "noswf: don't litter swap files everywhere
set directory=/tmp "dir: directory for temp files
" }

set statusline=%y%f%=%m%r%h%w\ %c\/%l\/%L

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
set listchars=nbsp:•,trail:¬,tab:>\ \ 
set expandtab
set tabstop=4
set shiftwidth=2

" line number
set number
set numberwidth=2

set virtualedit=block

set title
" }
" scroll {
"show three line before up and down => MAGIC
set scrolloff=4
"show 15 char before and after cursor => MAGIC
set sidescrolloff=15
set sidescroll=1
set background=dark
" }
"
command Vimrc :e C:\Users\Dev.PC-CONSERTO\AppData\Local\nvim\init.vim
" share clipboard system
set clipboard+=unnamedplus

nnoremap <Leader>e :e <C-R>=expand("%:p:h") . "\\" <CR>
noremap <Leader><Leader> :write<CR>

" Make Y behave like C and D.
" taken from https://github.com/tpope/vim-sensible
nnoremap Y y$


nnoremap <Leader>d diw
nnoremap <Leader>r "_ciw

" au BufReadPost,BufNewFile GestDoss_*.txt set syntax=logtalk
au BufReadPost,BufNewFile GestDoss_*.txt setlocal autoread | au CursorHold * checktime | call feedkeys("G")

command LogTail :e C:\Users\Dev.PC-CONSERTO\poly\logDev\Log\GestDoss_Log_Test.txt
command LogStop set eventignore=all
command LogContinue set eventignore=""
