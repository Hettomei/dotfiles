#!/bin/sh
# Pour démarrer cette session : ne pas lancer tmux.
# juste le bash, puis faire
# ./programmes/dotfiles/default/tmux-env/polyinfra.sh

tmux -u new-session \; \
  send-keys 'cd /d/code/codemigration/poly-new-pgd-back' C-m \; \
  split-window -h \; \
  send-keys 'cd /d/code/codemigration/poly-pgd-api' C-m \; \
  \
  new-window \; \
  send-keys 'cd /d/code/codemigration/poly-pgd-api' C-m \; \
  \
  new-window \; \
  send-keys 'cd /d/code/codemigration/' C-m \; \
  \
  new-window \; \
  select-window -t 0 \; \
  select-pane -t 0 \;
