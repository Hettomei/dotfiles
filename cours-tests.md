# Intro

On ne parle que des tests automatisés (Selenium entre dans la categorie)

Sondage : qui en a fait ? Est ce que j'ai besoin de convaincre de l'utilité ?

# Pourquoi les tests / Pourquoi tester ?

+ Tester c'est douter ? -> justement on sait qu'un programme est délicat, il faut douter.
+ Proteus sera gros. Impossible de repasser partout à chaque fois
+ Proteus est compliqué : on gère des dates, des droits
+ Plusieurs devs sur un même écran, si chacun fait son test, au moment du merge/conflit, il suffit de faire en sorte que tout passe
+ L'équipe grossit
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

# Quoi tester ?

Exemple avec Samuel, son reducer sur eppsettings
type: 'FETCH_SUCCESS' payload => avec ? sans ? null ? undefined ?

Une fonction compliquée -> toutes ses branches
Le comportement d'un component
ex : La mémoization d'un selecteur

Effet de bord :
Meilleur design des fonctions
Pas peur de refactor
Pas peur de mettre en prod
Montre aux débutants - sur le projet - comment sont utilisés les differents composants

On test le chemin idéal,
on montre comment la fonction doit etre utilisé

function add(x, y){
  return x + y
}

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

// Autre piege
// toujour vrai, exists() (de enzyme) renvoie un bool, exist (de Chai) renvoi 'true' si valeur est autre que null ou undefined, false 'existe' donc le test passe toujours
expect(wrapper.find('span className="btn btn-file btn-sm btn-foo"').exists()).to.exist
```

Si on avait d'abord vérifié que le test ne passe pas on aurait prouvé que le code change le test.

# Les tests ralentissent !

Au début, lorsqu'il n'y à aucun tests, en effet c'est long : trouver les outils / les compromis.
Une fois qu'une base existe : copier coller, adapter : ca reste plus rapide  que de rafraichir la page :

Exemple on veut s'assurer que :
'on veut que la case soit active si la date est un week end sur une semaine impaire'

Sans les tests :
code - compile - rechargement du navigateur - si Date.now() est une semaine pair, il faut cliquer pour aller sur une impaire, voir avec l'inspecteur (si le CSS n'est pas encore fait)

Avec les tests
la classe 'is-active' est appliqué sur le div lorsque la props

```
// ex : src/js/test/app/planning/PlanningTeamLineBackground.spec.js
// With odd week
const wrapper = shallow(<Case date={'2017-04-13'}/>)
expect(wrapper.prop('className')).to.equal('is-active')

// With even week
const wrapper = shallow(<Case date={'2017-04-22'}/>)
expect(wrapper.prop('className')).to.be.null
```

demain la spec évolue : 'les semaines sont active en rouge si durant la derniere semaine du mois' ...

Cas concret : InputFile, anthony à fait un simple refactor : surpimer des const self = this (car self === window)
InputFile à cassé, avec les tests on l'aurait vu. Je l'ai vu en voulant ajouter ma photo.

commit 0f4ee35fd374ce57b3ef2cdff9e769bc18eccca5
    $BT0 fix bug forms/InputFile : this.props doesnt exist in this context

    git-svn-id: http://10.11.4.106:18888/svn/repos/proteus/trunk@33750 43709e11-6b1d-0410-be10-800000000000

commit 26a647adc7f270e2e93b337848514bfd10883aed
    $BT0 completely test forms/InputFile

    git-svn-id: http://10.11.4.106:18888/svn/repos/proteus/trunk@33749 43709e11-6b1d-0410-be10-800000000000


# trucs et astuces

console.log(wrapper.debug());

Plein de facon de tester une meme chose : du moment que c'est lisible.

le wiki http://10.1.10.209:8080/wiki-etng/doku.php?id=etemptation-ng:proteus:testingreact

des questions ?

# résumé

- les tests c'est pas évident
- l'utilité des tests n'est pas evidente, il faut l'avoir experimenté
- ne pas se prendre la tete : montrer comment se comporte votre fonction / votre lib et c'est déjà énorme.
