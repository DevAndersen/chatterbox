#!/usr/bin/sh
ROOT_DIR="$(dirname -- "$0")/../"
lua-language-server --check $ROOT_DIR
