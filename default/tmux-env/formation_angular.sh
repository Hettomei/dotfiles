#!/bin/sh
# Pour démarrer cette session : ne pas lancer tmux.
# juste le bash, puis faire
# ./programmes/dotfiles/default/tmux-env/formation.sh

tmux new-session \; \
  send-keys 'cd ~/programmes/formation-angular/' C-m \; \
  send-keys 'npm start' \; \
  \
  split-window -h \; \
  send-keys 'cd ~/programmes/formation-angular/cours' C-m \; \
  \
  new-window \; \
  send-keys 'cd ~/programmes/formation-angular/app' C-m \; \
  send-keys 'npm start' \; \
  \
  split-window -h \; \
  send-keys 'cd ~/programmes/formation-angular/app' C-m \; \
  \
  new-window \; \
  send-keys 'cd ~/programmes/formation-angular' C-m \; \
  \
  select-window -t 0 \; \
  select-pane -t 0 \;
