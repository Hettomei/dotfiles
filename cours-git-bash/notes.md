But

Ce n'est pas une présentation débutant git ni débutant bash
C'est une présentation ou je vous montre les possibilité
puis vous googlez votre probleme.


# Git

Pour débutant aller sur https://learngitbranching.js.org/

man git
man git-checkout
....

master vs origin/master

git log -S
git log abcd
git log --pretty=fuller
git show abcd
git show --stat
git blame
git status
git diff
git diff --cached
git diff --cached --color-words
git diff master..HEAD
git whatchanged -p
git add -p -> code review ; s / edit
git reflog
git checkout -b branch-name -> seulement un pointeur sur commit
git checkout HEAD~
git checkout HEAD~1
git checkout HEAD~100
git bisect
git reset --hard -> attention, supprime les changement en cours
git reset --soft
git reset HEAD . -> sort les partie pret a etre commité

git shortlog -se -> on peut proposer un TD avec

git merge
git merge --no-ff
git cherry-pick
git rebase -i

git notes add -m "my first note"
git notes append -m "my second note"
git log
git log -p notes/commits

git pull -> fetch + merge
git pull --rebase
git fetch --prune

integration de svn

.gitconfig

-> On peut mettre son editeur préféré pour les commits message

git worktree
git worktree list
git worktree add /tmp/toto
git worktree prune


# TD : comment splitter un commit ?
git reset --soft HEAD~1

git reset HEAD . # pour enlever les partie pret a etre commit)
puis tu retourne dans un stade classique :
git add ...
git commit -m "commit 1"
git add ...
git commit -m "commit 2

# TROUVER Exemple git tricky

TODO find example a base de rebase checkout conflict ?


# bash

Parler de tmux ?
on faire le terminal -> pas de probleme
on ssh -> pas de problem

set -e
set -u -> prevent rm ''
set -x -> debug

apt install shell check

la redirection
cat toto.md 1> /dev/null # redirect stdout to dev null; so only stay errors
cat toto.md 2> /dev/null # redirect sterr to dev null; so only stay no error
cat toto.md 2&>1 # tout redirect to stdout

-> voir ./example_stderr.sh


from : http://www.compciv.org/topics/bash/variables-and-substitution/
user@host:~$ file_to_kill='Junk Final.docx'
user@host:~$ rm $file_to_kill
rm: cannot remove 'Junk': No such file or directory
rm: cannot remove 'Final.docx': No such file or directory

le `if [ "$a" -gt 3 ]`

entr / inotify
grep
grep -C 5
whereis
type
bc
sed
awk
find
head
tail -f
sort
uniq
wc
cat
less
yes
history
$()
(
...
) subshell
.......

# Exercice 1 :

J'ai une liste de fichiers de test exemple :
test/unit/widgets/NodeLayout/ReplayGridColumn.spec.js
test/unit/testTools/deepLinks/routes/Testtools.VodDPViewNavigationRoute.spec.js

Ces fichiers reproduit le path des sources.
exemple :

test/unit/widgets/NodeLayout/ReplayGridColumn.spec.js -> src/widgets/NodeLayout/ReplayGridColumn.js
test/unit/testTools/deepLinks/routes/Testtools.VodDPViewNavigationRoute.spec.js -> src/testTools/deepLinks/routes/Testtools.VodDPViewNavigationRoute.js

Certain fichier ne match aucun fichier.
Je veux la liste.

exemple
test/unit/datamodels/DataModel.RecordingList.spec.js doit etre retourné car
src/datamodels/DataModel.RecordingList.js n'existe pas

# Solution 1

solution naive, voir ./example_TD1.sh
meilleur solution, voir ./example_TD1_better.sh


# Exercice 2 :
git + bash

Le but : trouver à qui parler quand on découvre un fichier. Facon basique : voir qui à le plus de ligne de code 'active'
Je veux la liste de tous les commiters pour un fichier donné
- le nombre de lignes par commiter encore present pour ce fichier
(uniquement les lignes encore présente : ne pas afficher le commiter si les lignes ne sont plus presente)

Voir committers() dans bashrc

# exercice 3 :
Trouver la place des describe pour detecter des test unit strange


for i in $(find test/unit -name '*.spec.js')
do
  a=$(cat -n $i | grep -m 1 describe)
  echo $a $i
done

# Exercice : extraire un nombre
echo "✖ Found 35 circular dependencies!" | grep 'Found.\+circular' | sed 's/.\+Found \([0-9]\+\) .*/\1/'


# Bonus si temps
conf de bash
PS1
bc
autocomplete de git sur alias g

set -o vi
bind 'set completion-ignore-case on'
bind '"\e[A": history-search-backward' # search only previous string on key up
bind '"\e[B": history-search-forward' # search only next string on key down
stty werase undef
xdg-open
$?
tmpfile=$(mktemp /tmp/json.XXXXXX.js)

# Bonus si temps ++ -> tmux
# Bonus si temps +++ -> vim
