#!/bin/sh
# Pour démarrer cette session : ne pas lancer tmux.
# juste le bash, puis faire
# ./programmes/dotfiles/default/tmux-env/polyinfra.sh

tmux new-session \; \
  send-keys 'cd /c/Users/Dev.PC-CONSERTO/infracode/poly-jenkins-job-pgd-mep' C-m \; \
  \
  new-window \; \
  send-keys 'cd /c/Users/Dev.PC-CONSERTO/infracode/poly-jenkins-job-pgd-mep' C-m \; \
  \
  new-window \; \
  send-keys 'cd /c/Users/Dev.PC-CONSERTO/infracode/' C-m \; \
  \
  new-window \; \
  send-keys 'cd /c/Users/Dev.PC-CONSERTO/programmes/apache-archiva-2.2.3' C-m \; \
  send-keys './bin/archiva console' \; \
  \
  select-window -t 0 \; \
  select-pane -t 0 \;
