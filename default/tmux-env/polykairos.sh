#!/bin/sh
# Pour démarrer cette session : ne pas lancer tmux.
# juste le bash, puis faire
# ./programmes/dotfiles/default/tmux-env/polyinfra.sh

tmux new-session \; \
  send-keys 'cd /c/Users/Dev.PC-CONSERTO/codekairos/poly-kairos-assure' C-m \; \
  send-keys 'npm start' \; \
  split-window -v \; \
  send-keys 'cd /c/Users/Dev.PC-CONSERTO/codekairos/poly-kairos-assure' C-m \; \
  send-keys 'npm test' \; \
  \
  new-window \; \
  send-keys 'cd /c/Users/Dev.PC-CONSERTO/codekairos/poly-kairos-assure' C-m \; \
  \
  new-window \; \
  send-keys 'cd /c/Users/Dev.PC-CONSERTO/codekairos/' C-m \; \
  \
  new-window \; \
  \
  select-window -t 0 \; \
  select-pane -t 0 \;
