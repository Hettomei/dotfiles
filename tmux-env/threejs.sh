#!/bin/sh
# Pour démarrer cette session : ne pas lancer tmux.
# juste le bash, puis faire
# ./programmes/dotfiles/tmux-env/formation.sh

tmux new-session \; \
  send-keys 'cd ~/programmes/codingame/javascript/webgl-play' C-m \; \
  send-keys 'npm start' \; \
  new-window \; \
  send-keys 'cd ~/programmes/codingame/javascript/webgl-play' C-m \; \
  new-window \; \
  send-keys 'cd ~/programmes/codingame/javascript/webgl-play' C-m \; \
  new-window \; \
  select-window -t 0 \; \
  select-pane -t 0 \;
