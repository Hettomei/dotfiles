#!/bin/sh
# Pour démarrer cette session : ne pas lancer tmux.
# juste le bash, puis faire
# ./.teamocil/incub.sh

tmux new-session \; \
  send-keys 'cd ~/programmes/formation-react/cours-react' C-m \; \
  send-keys 'npm start' \; \
  \
  split-window -h \; \
  send-keys 'cd ~/programmes/formation-react/cours-react' C-m \; \
  \
  new-window \; \
  send-keys 'cd ~/programmes/formation-react/create-react-app' C-m \; \
  send-keys 'npm start' \; \
  \
  split-window -h \; \
  send-keys 'cd ~/programmes/formation-react/create-react-app' C-m \; \
  \
  new-window \; \
  send-keys 'cd ~/programmes/formation-react' C-m \; \
  \
  select-window -t 0 \; \
  select-pane -t 0 \;
