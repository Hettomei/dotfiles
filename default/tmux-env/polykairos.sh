#!/bin/sh
# Pour démarrer cette session : ne pas lancer tmux.
# juste le bash, puis faire
# ./programmes/dotfiles/default/tmux-env/polyinfra.sh

tmux new-session \; \
  send-keys 'cd /d/code/codekairos/poly-kairos-assure' C-m \; \
  send-keys 'nvm_run; npm start' \; \
  split-window -h \; \
  send-keys 'cd /d/code/codekairos/poly-kairos-assure' C-m \; \
  send-keys 'nvm_run; npm run e2e' \; \
  \
  new-window \; \
  send-keys 'cd /d/code/codekairos/poly-kairos-assure' C-m \; \
  send-keys 'nvm_run' C-m \; \
  \
  new-window \; \
  send-keys 'cd /d/code/codekairos/' C-m \; \
  \
  new-window \; \
  \
  select-window -t 0 \; \
  select-pane -t 0 \;
