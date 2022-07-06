#########################page_de_slide
                              - 0/11 -
1 ... 38 lignes doivent etre affichées

contrast day -> edit preference, solarized light
:set background=light

F5 back, F6, next
F9 create a new one


..................|....................
.....slides.......|....................
..................|....................
..................|.......code.........
..................|....................
..................|....................
..................|....................





















#########################page_de_slide
                              - 1/11 -

# Vim ?

Vi  -> Initial release 1976

Vim -> Initial release 1991

NeoVim ?



Vim principalement 2 modes :

normal -> chaque touche est un raccourci
insert

(au début, le visual mode)






















#########################page_de_slide
                              - 2/11 -

# Mouvements

se déplacer avec f, t, s, ?, /, ^, $, s

hjkl la home row
gg
G
:number

ebw
EBW

sur un fichier, une class, un partial => gf

]m -> se deplace de méthode en méthode. Ex : 3]m























#########################page_de_slide
                              - 3/11 -

# Copy Paste

y
yy
p
P
Y
d
dd
D
d$

***********************
*                     *
*        dtc          *
*                     *
***********************





















#########################page_de_slide
                              - 4/11 -

# Insertion

i a I A
o O
J
gJ


C-v I toto -> esc
Dessiner un carré : C-v 10l 5j r #

c^

di"
dit
cia
ci(
ci{
ca[
cs"' (change suround)

snippet -> bmbm

vvvvvc
( aaa ( bbb cccc ( ddd "eeee fff 'gggg' hhhh" iiii) jjjjj) kkkkkk)

Pour changer de sens : o
vvvvvo

C-a 28
C-x 9

200 C-a 243

C-n C-l # mot du buffer
C-x C-n # ligne entiere


#########################page_de_slide
                              - 5/11 -

# Search and replace

:%s/a/b
:%s/a/&ccc
:%s/a/&ccc/c
:%s/\d\d/& - nombre a 2 chiffres /c

v .... lignes
:s/a/&ccc/c
search and replace
spc sr



























#########################page_de_slide
                              - 6/11 -

# Les fenetres

C-j
C-k
C-l
C-m

Split
C-w s
C-w v

Move
C-w L

























#########################page_de_slide
                              - 7/11 -

# Macro

Comme tous les editeurs

qa
@a
@@
10@@


ex : paginer mes slides
gg
y      - slide 0/11-
page_de_slide *
                              - 8/11 -
























#########################page_de_slide
                              - 9/11 -

# Avec des fichiers

spc e

affichage du nom
%f

affichage du path
%%


C-p bien entendu


aller sur le fichier gf
au dessus d'une url gx https://en.wikipedia.org/wiki/Vim_(text_editor)
besoin de fetch     gf https://pokeapi.co/api/v2/berry/3
-> :%!jq .




mksession
vim -S


vim -O

vim -d

vim test.file +255







#########################page_de_slide
                              - 10/11 -

# Pourquoi investir ?


Pour la culture, le ssh, la vitesse

gmail
9gag
sed

ultime en bash




























#########################page_de_slide
                              - 11/11 -

# Aller plus loin

:help
https://www.vimgolf.com/

CSV to MD format
http://www.vimgolf.com/challenges/6030936d3f9325000c6aa0aa

I forgot quotes
http://www.vimgolf.com/challenges/5462e3f41198b80002512673

:Vimrc


lire la config des autres



Lire un fichier tar.gz
lire un zip
lire une log de 10go long_file.log

















#########################page_de_slide
                              - 12/11 -

# The End ?

On a survolé 1%

-> enter Emacs.
Vim x 1000
































#########################page_de_slide
                              - 13/11 -


