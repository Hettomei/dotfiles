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
