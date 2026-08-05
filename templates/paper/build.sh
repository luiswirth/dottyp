#!/usr/bin/env sh

set -e
export TYPST_PACKAGE_PATH="$PWD/lib/dottyp/pkg"
mkdir -p out
typst compile src/main.typ out/document.pdf --root "$PWD"
