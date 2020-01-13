# How to use it

## When you get a fresh new $HOME

Just run

```
./restore_rc_files.sh
./restore_tmux.sh
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

./restore_emacs.sh windows window
# Will restore from dotfiles/windows
```

# Starting to automate vps installation

Look at vps.sh
