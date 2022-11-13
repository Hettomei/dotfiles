# How to use it

## When you get a fresh new $HOME

Just run

```
./restore_rc_files.sh
./restore_emacs.sh
```

And read the comment at the end.

## To save current configuration

```
./copy_here.sh
```

then `git push`

# Hint

You can pass an argument to `./restore*` and `./copy_here.sh` and it will create the named folder to store conf.

```
./copy_here.sh windows
# Will save configuration in dotfiles/windows

./restore_emacs.sh windows
# Will restore from dotfiles/windows
```

# Starting to automate vps installation

Look at first_install.md

# Ensemble programming / mob programming

Merci pour cette video : https://www.youtube.com/watch?v=c_oW0yJWveQ

besoin d installer :
```
sudo apt install fd-find entr
```

Je vous conseil de mettre ces deux fichier dans:

```
mv default/ensemble_programming_* ~/bin/
chmod +x ~/bin/ensemble_programming_*
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
