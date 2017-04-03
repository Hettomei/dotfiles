Plusieurs type de tests :

Il y a le BDD (behavior ....)
avantage : decide le design avant
inconvenient : difficile si pas habitué

Ceux pour lesquelles se concentrer :

+ test de non régression :
  on corrige une ano, on ajoute le tests pour ne pas que cette ano se reproduise

+ test pour 'fixer le dev' :
  On code sa fonctionnalité, on ajotue des tests pour montrer / documenter et fixer le comportement.


Quoi tester ?

Exemple avec Samuel, sont reducer sur eppsettings
type: 'FETCH_SUCCESS' payload => avec ? sans ? null ? undefined ?
