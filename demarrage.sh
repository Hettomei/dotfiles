set -eu

#get the dir where this script is launched
CURRENT_DIR=$(dirname "$(realpath $0)")

"$CURRENT_DIR/tmux-env/polypgdapi.sh"
