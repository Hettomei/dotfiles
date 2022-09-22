#!/bin/sh
# Pour démarrer cette session : ne pas lancer tmux.
# juste le bash, puis faire
# ./programmes/dotfiles/default/tmux-env/incub.sh

tmux new-session \; \
  send-keys './demarrage.sh' \; \
  \
  split-window -v \; \
  send-keys 'incub vpn deconnecter # ./stoppage.sh' \; \
  \
  split-window -h \; \
  send-keys 'rappel "09h28" "Teams"' C-m \; \
  \
  new-window \; \
  send-keys 'cd ~/poleemploi/referentiel_enf' C-m \; \
  \
  select-window -t 0 \; \
  select-pane -t 0 \;
  # split-window -v \; \
