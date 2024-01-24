#!/bin/sh
# Pour démarrer cette session : ne pas lancer tmux.
# juste le bash, puis faire
# ./programmes/dotfiles/default/tmux-env/polyinfra.sh

tmux new-session \; \
  send-keys 'cd /d/code/codeinfra/poly-jenkins-job-pgd-mep' C-m \; \
  \
  new-window \; \
  send-keys 'cd /d/code/codeinfra/poly-jenkins-job-pgd-mep' C-m \; \
  \
  new-window \; \
  send-keys 'cd /d/code/codeinfra/' C-m \; \
  \
  new-window \; \
  send-keys 'cd /d/code/programmes/apache-archiva-2.2.3' C-m \; \
  send-keys './bin/archiva console' \; \
  \
  select-window -t 0 \; \
  select-pane -t 0 \;
