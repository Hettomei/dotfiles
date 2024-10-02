#!/bin/sh
# Pour démarrer cette session : ne pas lancer tmux.
# juste le bash, puis faire
# ./programmes/dotfiles/tmux-env/formation.sh

tmux new-session \; \
  send-keys 'cd ~/formation-angular' C-m \; \
  \
  split-window -h \; \
  send-keys 'cd ~/formation-angular' C-m \; \
  \
  new-window \; \
  send-keys 'cd ~/formation-angular' C-m \; \
  \
  new-window \; \
  send-keys 'cd ~/formation-angular' C-m \; \
  \
  select-window -t 0 \; \
  select-window -t 1 \; \
  select-window -t 2 \; \
  select-window -t 0 \; \
  select-pane -t 0 \;
