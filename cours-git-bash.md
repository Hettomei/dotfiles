# But

Ce n'est pas une présentation débutant git ni débutant bash
C'est une présentation ou je vous montre les possibilité
puis vous googlez votre probleme.


# Git

Pour débutant aller sur https://learngitbranching.js.org/

git : arbre binaire

master vs origin/master

git log -S
git log abcd
git show abcd
git rebase -i
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

git pull -> fetch + merge
git fetch --prune

integration de svn

.gitconfig

git worktree
git worktree add /tmp/toto


# Exemple git tricky

TODO find example a base de rebase checkout conflict ?


# bash

Parler de tmux ?
on faire le terminal -> pas de problem
on ssh -> pas de problem

set -e
set -u -> prevent rm ''
set -x -> debug

apt install shell check

la redirection
cat toto.md 1> /dev/null # redirect stdout to dev null; so only stay errors
cat toto.md 2> /dev/null # redirect sterr to dev null; so only stay no error


from : http://www.compciv.org/topics/bash/variables-and-substitution/
user@host:~$ file_to_kill='Junk Final.docx'
user@host:~$ rm $file_to_kill
rm: cannot remove 'Junk': No such file or directory
rm: cannot remove 'Final.docx': No such file or directory

Exercice :

J'ai une liste de fichiers de test.
Ces fichiers doivent être dans un path précis qui reproduit celui des sources.
Fichier de test : dans /test/unit/ *.spec.js
Fichier source : dans /src et pas de ".spec"

Exemple :
test/unit/datamodels/DataModel.RecordingList.spec.js est mal placé car src/datamodels/DataModel.RecordingList.js n'existe pas

il devrait etre dans test/unit/views/recordinglist/RecordingList.DataModel.spec.js

```
solution naive :

for i in $(find test/unit -name '*.spec.js')
do
    filePath=$(echo $i | sed 's/test\/unit/src/' | sed 's/\.spec\.js/.js/')
    cat $filePath &> /dev/null
    RESULT=$?
    if [ $RESULT -gt 0 ]
    then
        echo $i
    fi
done


meilleure solution:

set -e

for i in $(find test/unit -name '*.spec.js')
do
  file=$(echo $i | sed 's/test\/unit/src/' | sed 's/\.spec\.js/.js/')
  if [ ! -f "$file" ]
  then
    echo $file
  fi
done
```
