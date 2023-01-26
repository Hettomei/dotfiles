#!/bin/sh
# Pour démarrer cette session : ne pas lancer tmux.
# juste le bash, puis faire
# ./programmes/dotfiles/default/tmux-env/poly.sh

tmux new-session \; \
  send-keys './demarrage.sh' \; \
  \
  split-window -v \; \
  send-keys 'idea' \; \
  split-window -h \; \
  send-keys 'rappel "09h59" "Teams"' C-m \; \
  \
  new-window \; \
  send-keys 'cd ~/poly/poly-pgd-gestion-dossiers/' C-m \; \
  \
  select-window -t 1 \; \
  select-pane -t 0 \;
  # split-window -v \; \
