#!/bin/sh
# Pour démarrer cette session : ne pas lancer tmux.
# juste le bash, puis faire
# ./programmes/dotfiles/default/tmux-env/polyinfra.sh

tmux new-session \; \
  send-keys 'cd /d/code/codepgd/utilitaire/jboss_local' C-m \; \
  split-window -v \; \
  send-keys 'cd /d/Java' C-m \; \
  \
  new-window \; \
  send-keys 'cd /d/code/codepgd/poly-pgd-core' C-m \; \
  split-window -h \; \
  send-keys 'cd /d/code/codepgd/poly-pgd-gestion-dossiers' C-m \; \
  split-window -v \; \
  send-keys 'cd /d/code/codepgd/poly-pgd-web-principal' C-m \; \
  select-pane -t 0 \; \
  split-window -v \; \
  send-keys 'cd /d/code/codepgd/poly-pgd-client-commun' C-m \; \
  \
  new-window \; \
  send-keys 'cd /d/code/codepgd/' C-m \; \
  \
  new-window \; \
  \
  select-window -t 0 \; \
  select-pane -t 0 \;
