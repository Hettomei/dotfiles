#!/bin/sh
# Pour démarrer cette session : ne pas lancer tmux.
# juste le bash, puis faire
# ./programmes/dotfiles/default/tmux-env/formation.sh

tmux new-session \; \
  send-keys 'cd ~/programmes/formation-angular/ ; nvm_run' C-m \; \
  \
  split-window -h \; \
  send-keys 'cd ~/programmes/formation-angular/cours ; nvm_run' C-m \; \
  \
  new-window \; \
  send-keys 'cd ~/programmes/formation-angular/app; nvm_run' C-m \; \
  send-keys 'npx ng serve --open' \; \
  \
  new-window \; \
  send-keys 'cd ~/programmes/formation-angular/app; nvm_run' C-m \; \
  \
  new-window \; \
  \
  select-window -t 0 \; \
  select-pane -t 0 \;
