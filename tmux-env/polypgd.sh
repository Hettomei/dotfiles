#!/bin/sh
# Pour démarrer cette session : ne pas lancer tmux.
# juste le bash, puis faire
# ./programmes/dotfiles/tmux-env/polyinfra.sh

tmux new-session \; \
  send-keys 'cd /c/poly/code/pgd/utilitaire/jboss_local' C-m \; \
  split-window -v \; \
  send-keys 'cd /c/poly/java' C-m \; \
  \
  new-window \; \
  send-keys 'cd /c/poly/code/pgd/poly-pgd-core' C-m \; \
  split-window -h \; \
  send-keys 'cd /c/poly/code/pgd/poly-pgd-gestion-dossiers' C-m \; \
  split-window -v \; \
  send-keys 'cd /c/poly/code/pgd/poly-pgd-web-principal' C-m \; \
  select-pane -t 0 \; \
  split-window -v \; \
  send-keys 'cd /c/poly/code/pgd/poly-pgd-client-commun' C-m \; \
  \
  new-window \; \
  send-keys 'cd /c/poly/code/pgd/' C-m \; \
  \
  new-window \; \
  \
  select-window -t 0 \; \
  select-pane -t 0 \;
