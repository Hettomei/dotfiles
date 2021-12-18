#!/bin/sh
# Pour démarrer cette session : ne pas lancer tmux.
# juste le bash, puis faire
# ./.teamocil/incub.sh
# :D
tmux new-session \; \
  send-keys 'docker run --rm hello-world && ./demarrage.sh && sleep 1 && firefox' \; \
  \
  split-window -v \; \
  send-keys './stoppage.sh' \; \
  \
  split-window -h \; \
  send-keys 'rappel "09h25" "Skype"' C-m \; \
  \
  new-window \; \
  send-keys 'cd ~/poleemploi/referentiel_enf/tesi-vm' C-m \; \
  \
  split-window -h \; \
  send-keys 'cd ~/poleemploi/referentiel_enf/tesi-vm' C-m \; \
  \
  select-window -t 0 \; \
  select-pane -t 0 \;
  # split-window -v \; \
