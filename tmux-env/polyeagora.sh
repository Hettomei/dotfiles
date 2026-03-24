# Pour démarrer cette session : ne pas lancer tmux.
# juste le bash, puis faire
# ./programmes/dotfiles/tmux-env/polypgdapi.sh

tmux -u new-session \; \
  send-keys 'cd $HOME/polywsl/code/eagora/poly-eagora' C-m \; \
  send-keys 'everyday_health ; everyday_download_localhostaccess ; everyday_surveillance_batch' \; \
  new-window \; \
  send-keys 'cd $HOME/polywsl/code/eagora/poly-eagora' C-m \; \
  new-window \; \
  send-keys 'cd $HOME/polywsl/code/batch/poly-pgd-batch-escalade-relance' C-m \; \
  \
  select-window -t 0 \; \
  select-pane -t 0 \;
