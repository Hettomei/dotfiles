---
author: 'Timothée GAUTHIER / Conserto / instant technique'
title: 'Git & Bash'
date: 2019-02-14
patat:
  slideLevel: 2
  wrap: true
  margins:
    left: 2
    right: 2
...

# Git & Bash

## Pourquoi un instant tech quand tout est sur le net ?

. . .

- Parce que j'ai des collegues

. . .

- Parce que <https://learngitbranching.js.org/> n'est jamais suivis.

## Format de l'instant tech

Beaucoup de blabla rapide :

- Les connaisseurs ne s'ennuient pas

- Les novices enregistrent et vont sur google

- Quelques TD; la pratique y a que ça de vrai

# git

## whatis git

```
$ whatis git
git (1)              - the stupid content tracker
```

. . .

créé par Linus Torvalds en 2005

"git" parce que linus est un egocentrique

## Probleme "y a plus github"

. . .

Vous êtes en formation.

. . .

Vous avez un TP à faire à plusieurs.

. . .

Il y a un super proxy trop bien configuré : il bloque tout.

. . .

Comment partagez vous le code ?

. . .

Facile !

```
$ ls /media/clef_usb_haxor/

h2g2-3          marie-v2.2.b
h2g2-3.1        marie-v2.3.a
h2g2-3.14       thomas-v0.2
h2g2-v3.141     thomas-v1.11.final
h2g2-v3.1415    thomas-v1.2
marie-v0.20     thomas-v2.2
marie-v1.2.a    thomas-v2.2.2
marie-v1.final  thomas-v2.3
marie-v2.2.A
```

## Solution "y a plus github"

Solution possible :

```
man git init
git init --bare
```

. . .


DEMO !

## Probleme "Non j'ai jamais fait de merge !"

Ou autrement appelé

"Mais regarde il me demande toujours d'ecrire un message !"

. . .

DEMO !

## Solution "Non j'ai jamais fait de merge !"

```
man git pull
git pull --rebase
```

# Bash

## Survivre sans internet : man

```
man man
help help
info bash
```

# The end

```
_______________
| Questions ? |
---------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

## sources

- <https://fr.wikipedia.org/wiki/Git>
- <https://fr.wikipedia.org/wiki/Man_(Unix)>
- `man git`
- <https://github.com/jaspervdj/patat>
- Les slides : <https://github.com/Hettomei/my_computer_conf/tree/master/cours-git-bash>
- <https://learngitbranching.js.org/>


```


                         _
                        (_)
 _ __ ___   ___ _ __ ___ _
| '_ ` _ \ / _ \ '__/ __| |
| | | | | |  __/ | | (__| |
|_| |_| |_|\___|_|  \___|_|





```
