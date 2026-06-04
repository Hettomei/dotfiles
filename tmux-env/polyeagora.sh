# Pour démarrer cette session : ne pas lancer tmux.
# juste le bash, puis faire
# ./programmes/dotfiles/tmux-env/polypgdapi.sh

tmux -u new-session \; \
  send-keys 'cd $HOME/polywsl/code/eagora/poly-eagora-back' C-m \; \
  send-keys 'idea; everyday_health ; everyday_download_localhostaccess ;' \; \
  new-window \; \
  send-keys 'cd $HOME/polywsl/code/eagora/poly-eagora-back' C-m \; \
  \
  select-window -t 0 \; \
  select-pane -t 0 \;
