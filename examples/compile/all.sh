#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BIN_DIR="$SCRIPT_DIR"/../../bin

# shellcheck source=../../bash/funcs.bash
source "$SCRIPT_DIR/../../bash/funcs.bash"

build_dpp

# Restore when there are files
# for x in "$SCRIPT_DIR"/*.dpp
# do
#     echo "Testing compileable $x"
#     "$BIN_DIR"/d++ --hard-fail --keep-pre-cpp-files -c -of/tmp/compile.o "$x"
# done
