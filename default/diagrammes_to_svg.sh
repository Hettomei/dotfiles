#!/bin/bash
# converts all puml files to svg

set -eu

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR=$(realpath "$CURRENT_DIR/..")

DIAG_DIR="$ROOT_DIR/diagrammes"

echo "Converting all .puml files :"
ls "$DIAG_DIR"/*.puml

# Pour voir la doc des parametre, faire :
# docker run --rm plantuml/plantuml -h

docker run --rm --user "$(id -u):$(id -g)" -v "$DIAG_DIR:/all_puml" plantuml/plantuml \
  --skip-fresh --progress-bar --duration --format svg \
  --output-dir "/all_puml/svg" "/all_puml/*.puml"

if ! command -v xmllint &>/dev/null; then
    echo "xmllint est absent. Installer avec : "
    echo "sudo apt install libxml2-utils"
    exit 1
fi

for f in "$DIAG_DIR/svg"/*.svg; do
  echo "xmllint $f"
  xmllint --format "$f" -o "$f";
done

echo "Done generating"
