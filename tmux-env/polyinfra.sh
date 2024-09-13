#!/bin/sh
# Pour démarrer cette session : ne pas lancer tmux.
# juste le bash, puis faire
# ./programmes/dotfiles/tmux-env/polyinfra.sh

tmux -u new-session \; \
  send-keys 'cd /c/poly/code/codeinfra/poly-jenkins-job-pgd-mep' C-m \; \
  \
  new-window \; \
  send-keys 'cd /c/poly/code/codeinfra/poly-jenkins-job-pgd-mep' C-m \; \
  \
  new-window \; \
  send-keys 'cd /c/poly/code/codeinfra/' C-m \; \
  \
  new-window \; \
  select-window -t 0 \; \
  select-pane -t 0 \;
