#!/usr/bin/env sh

set -e
cd "$(dirname "$0")"
self="$PWD/$(basename "$0")"
# The package root comes from the flake, so the environment is what a
# compile needs and not merely the binary.
[ -n "$TYPST_PACKAGE_PATH" ] || exec nix develop --command "$self" "$@"

mkdir -p out

for file in test/*.typ; do
  typst compile "$file" "out/$(basename "$file" .typ)-{p}.png" --ppi 130 --root "$PWD"
done
