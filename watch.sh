#!/usr/bin/env sh
# Watches one test file, named without its extension: ./watch.sh layout

set -e
export TYPST_PACKAGE_PATH="$PWD/pkg"
mkdir -p out

name="${1:-showcase}"
typst watch "test/$name.typ" "out/$name.pdf" --root "$PWD"
