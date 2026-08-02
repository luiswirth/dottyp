#!/usr/bin/env sh
# Compiles every test file to out/. Looking at the pages is the test.

set -e
export TYPST_PACKAGE_PATH="$PWD/pkg"
mkdir -p out

for file in test/*.typ; do
  typst compile "$file" "out/$(basename "$file" .typ)-{p}.png" --ppi 130 --root "$PWD"
done
