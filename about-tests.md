# Intro

On ne parle que des tests automatisés (Selenium entre dans la categorie)

Sondage : qui en a fait ? Est ce que j'ai besoin de convaincre de l'utilité ?

# Pourquoi les tests / Pourquoi tester ?

+ Tester c'est douter ? -> justement on sait qu'un programme est délicat, il faut douter.
+ Proteus sera gros. Impossible de repasser partout à chaque fois
+ Proteus est compliqué : on gère des dates, des droits
+ Plusieurs devs sur un même écran, si chacun fait son test, au moment du merge/conflit, il suffit de faire en sorte que tout passe
+ L équipe grossit
+ 'Rapid feedback' -> la suite de tests prend 256 ms pour 74 tests // 300 pour 100 // 3s pour 1000 // 30s pour 10 000
+ Les tests servent de documentations (ex : app/planning/PlanningTeamLineBackground.spec.js)

Exemple réels :
On comparait deux utilisateurs dans les grandes lignes : on supprimait nom prenom et id, pour ne garder que
email, role ....
Quelqu'un à ajouté 1 colonnes en BDD 'created_at' (n'a pas touché au reste du code)
Tout était renvoyé, l'appli tournait tres bien. Mais les tests ont 'vu' que la fonction n'était plus bonne.

# Est ce que ce n'est pas faire deux fois le taf avec l'indus ?

Est ce que l'indus reprend réellement tout en détail ?
Est ce que l'indus test absolument toutes les configurations clients ?
Justement un client nous parle d'un bug -> ajout du test de non régression
couplage avec des outils tel que new relic

# Plein de style de tests

Plusieurs type de tests :

Il y a le BDD (behavior ....)
avantage : decide le design avant
inconvenient : difficile si pas habitué

Ceux sur lesquels se concentrer :

+ test pour 'fixer le dev' :
  On code sa fonctionnalité, on ajoute des tests pour montrer / documenter et fixer le comportement.

+ test de non régression :
  on corrige une ano, on ajoute le tests pour ne pas que cette ano se reproduise

Quoi tester ?

Exemple avec Samuel, son reducer sur eppsettings
type: 'FETCH_SUCCESS' payload => avec ? sans ? null ? undefined ?


Quoi tester :

Une fonction compliquée -> toute ses branches
Le comportement d'un component
La mémoization d'un selecteur


Effet de bord :
Meilleur design des fonctions
Pas peur de refactor
Montre aux débutant - sur le projet - comment sont utilisé les differents composant


Liste des fichiers intéressant :


Exercice ? (faire un coding dojo ? en js ? bowling ?)


# Détail des libs
Mocha -> test framework -> describe it context, reporting, retry ....
Chai -> assertion library -> empty, equal, above...
Enzyme -> Tester les components
Sinon -> mock / stub

# pourquoi red green refactor ?

Il faut un certain temps avant de faire de bon test,

Souvent on 'doute' de la suite de tests, et on tests les tests

```js
// toujours vrai, wrapper renvoie toujours un objet
expect(wrapper.find('span className="btn btn-file btn-sm btn-foo"')).to.be.ok

// tests réellement
expect(wrapper.find('span className="btn btn-file btn-sm btn-foo"').exists()).to.be.ok

// toujour vrai, exists() (de enzyme) renvoie un bool, exist (de Chai) renvoi 'true' si valeur est autre que null ou undefined, false 'existe' donc le test passe toujours
expect(wrapper.find('span className="btn btn-file btn-sm btn-foo"').exists()).to.exist
```

Si on avait d'abord vérifié que le test ne passe pas on aurait prouvé que le code change le test.

# trucs et astuces

console.log(wrapper.debug());

Plein de facon de tester une meme chose : du moment que c'est lisible.
