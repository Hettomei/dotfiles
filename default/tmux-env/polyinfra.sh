#!/bin/sh
# Pour démarrer cette session : ne pas lancer tmux.
# juste le bash, puis faire
# ./programmes/dotfiles/default/tmux-env/polyinfra.sh

tmux new-session \; \
  send-keys 'cd /c/Users/Dev.PC-CONSERTO/infracode' C-m \; \
  \
  new-window \; \
  send-keys 'cd /c/Users/Dev.PC-CONSERTO/infracode' C-m \; \
  \
  select-window -t 0 \; \
  select-pane -t 0 \;
