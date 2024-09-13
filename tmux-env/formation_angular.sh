#!/bin/sh
# Pour démarrer cette session : ne pas lancer tmux.
# juste le bash, puis faire
# ./programmes/dotfiles/tmux-env/formation.sh

tmux new-session \; \
  send-keys 'cd ~/programmes/formation-angular/formation_digital_angular/formation/consignes_tps/solution-complete/' C-m \; \
  \
  split-window -h \; \
  send-keys 'cd ~/programmes/formation-angular/formation_digital_angular/formation/consignes_tps/solution-complete/' C-m \; \
  \
  new-window \; \
  send-keys 'cd ~/programmes/formation-angular/formation_digital_angular/formation/consignes_tps/solution-complete/' C-m \; \
  \
  new-window \; \
  send-keys 'cd ~/programmes/formation-angular/' C-m \; \
  \
  new-window \; \
  \
  select-window -t 0 \; \
  select-pane -t 0 \;
