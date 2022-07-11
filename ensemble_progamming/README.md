Merci pour cette video : https://www.youtube.com/watch?v=c_oW0yJWveQ

besoin d installer :
```
sudo apt install fd-find entr
```

Je vous conseil de mettre ces deux fichier dans:

```
mv ensemble_programming_pull ~/bin/
mv ensemble_programming_push ~/bin/
chmod +x ensemble_programming_*
```

puis

```
ensemble_programming_pull 15
```

ou

```
# surveille tous les fichiers
ensemble_programming_push . "WIP new feature"

# surveille les fichiers avec "py"
ensemble_programming_push py "WIP new feature"
```
