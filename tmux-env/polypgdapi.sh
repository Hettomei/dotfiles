# Pour démarrer cette session : ne pas lancer tmux.
# juste le bash, puis faire
# ./programmes/dotfiles/tmux-env/polypgdapi.sh

tmux -u new-session \; \
  send-keys 'cd $HOME/polywsl/code/pgdapi/poly-pgd-api' C-m \; \
  new-window \; \
  send-keys 'cd $HOME/polywsl/code/pgdapi/poly-pgd-api' C-m \; \
  \
  new-window \; \
  select-window -t 0 \; \
  select-pane -t 0 \;
