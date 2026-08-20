#!/usr/bin/env sh
# Watches one test file, named without its extension: ./watch.sh layout

set -e
cd "$(dirname "$0")"
self="$PWD/$(basename "$0")"
# The package root comes from the flake, so the environment is what a
# compile needs and not merely the binary.
[ -n "$TYPST_PACKAGE_PATH" ] || exec nix develop --command "$self" "$@"

mkdir -p out

name="${1:-showcase}"
typst watch "test/$name.typ" "out/$name.pdf" --root "$PWD"
