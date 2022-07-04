#########################page_de_slide

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

# Vim ?

Vi  -> Initial release 1976

Vim -> Initial release 1991

NeoVim ?



Vim principalement 2 modes :

normal -> chaque touche est un raccourci
insert

(au début, le visual mode)






















#########################page_de_slide

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

C-a 5
C-x 20

200 C-a -100

C-n C-l # mot du buffer
C-x C-n # ligne entiere


#########################page_de_slide

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

# Macro

Comme tous les editeurs

qa
@a
@@
10@@






























#########################page_de_slide

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














#########################page_de_slide

# Pourquoi investir ?


Pour la culture, le ssh, la vitesse

gmail
9gag
sed

ultime en bash




























#########################page_de_slide

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

# The End ?

On a survolé 1%

-> enter Emacs.
Vim x 1000
































#########################page_de_slide


