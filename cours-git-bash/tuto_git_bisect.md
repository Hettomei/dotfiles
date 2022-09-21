Git est utilisé dans tous les projets impliquant du code,
si vous n'utilisez pas git, c'est que vous [travaillez pour Google](https://cacm.acm.org/magazines/2016/7/204032-why-google-stores-billions-of-lines-of-code-in-a-single-repository/fulltext)
En attendant de changer de boite, pourquoi ne pas ajouter un outil à votre ceinture ?

Tuto: comment exploiter `git bisect`


```
man git-bisect

git-bisect - Trouver par recherche binaire la modification qui a introduit un bogue
```

Traduction :

Vous développez votre solution.
Vous avancez de plusieurs centaines de commits,
et vous vous rendez compte que certains clients experimentent un bug dans un cas particulier.
Vous avez réussi à le reproduire, mais en analysant le code, pas moyen de comprendre pourquoi,
et donc ce serait extremement pratique de retrouver LE commit qui introduit ce changement !

(Bien entendu, votre pipeline de continuous-delivery est toujours "OK" après chaque commit.
Donc on ne va pas pouvoir les exploiter, seulement ajouter un test de non-regression à la fin.)

Une solution : `le git-bisect`,
comme c'est une recherche par dichotomie, pour 1500 commits, il lui faut environ 11 etapes,
donc c'est plutot bien adapté pour retrouver le coupable.


Pour pouvoir opérer, `git bisect` à besoin d'un commit valide (good)
et un avec le bug (bad). Nous allons l'initialiser :

```
git checkout master

# démarrer bisect
git bisect start

# on s'assure de reproduire le bug et

# on marque le commit comme "mauvais"
git bisect bad

# On remonte dans le passé d'une valeur arbitraire
git checkout HEAD~300

# Le bug n'est pas présent, on en informe git
git bisect good
```

Une fois les 2 bornes délimités, `git bisect` s'occupe de "sauter" de commit en commit.
Dans notre cas il nous déplace et affiche :

```
Bisecting: 1098 revisions left to test after this (roughly 10 steps)
[1177ec9c8b0993293626a3158b442e536b9e8720] New feature find_component_version
```


donc il nous reste plus qu'a tester et marquer le commit :

```
# On reproduit le bug :
git bisect bad

# On ne reproduit pas le bug :
git bisect good

# ce commit n'est pas un bon candidat pour valider le bug :
git bisect skip
```

A la dernière étape, git affiche LE commit coupable.
Vous pouvez toujours le réafficher ou revoir les étapes avec :

```
git bisect view
git bisect log
```

Pensez toujours à `git bisect reset` quand vous avez terminé.

Ce `git bisect` est semi automatique, il faut rester derriere le clavier. On peut faire mieux.

Imaginons que votre application a besoin de se lancer dans un environnement
de staging pour reproduire le bug et que chaque commit peux prendre plusieurs minutes.

LA solution : `git bisect run ~/script.sh`

ex :

```
git checkout master
git bisect start
git bisect bad
git checkout HEAD~300
git bisect good
git bisect run ./test-bisect.sh
```
