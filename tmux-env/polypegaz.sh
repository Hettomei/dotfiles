#!/bin/sh
# Pour démarrer cette session : ne pas lancer tmux.
# juste le bash, puis faire
# ./programmes/dotfiles/tmux-env/polypegaz.sh

tmux new-session \; \
  send-keys 'cd /c/poly/code/codepegaz/pegazv2' C-m \; \
  send-keys './mvnw' \; \
  \
  split-window -h \; \
  send-keys 'cd /c/poly/code/codepegaz/pegazv2' C-m \; \
  send-keys 'npx cypress open' \; \
  \
  new-window \; \
  send-keys 'cd /c/poly/code/codepegaz/pegazv2' C-m \; \
  \
  select-window -t 0 \; \
  select-pane -t 0 \;
