#!/usr/bin/env sh

mkdir -p out
typst compile src/main.typ out/thesis.pdf --root $(pwd)
