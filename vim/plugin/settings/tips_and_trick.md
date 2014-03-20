# Tips and tricks

## g with norm
http://briancarper.net/blog/165/
example:
:g/\d/norm o999

## Encoding
http://stackoverflow.com/questions/778069/how-can-i-change-a-files-encoding-with-vim
Notice that there is a difference between
set encoding
and
set fileencoding

Donc pour modifier un fichier, faire :
set fileencoding=utf-8
:wq
