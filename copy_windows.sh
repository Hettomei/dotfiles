#! /bin/bash
set -eu

#get the dir where this script is launched
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DIR="$CURRENT_DIR/${1:-windows}"


cat <<-____HERE

Ce script est à réécrire : 
le but c'est qu'il prenne les dossier windows (donc \$APPDATA & co)

et qu on fasse la separation msys de windows wui lui peut avoir une autre conf

____HERE

# git add -p
# git status
