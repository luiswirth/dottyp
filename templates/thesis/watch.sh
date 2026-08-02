#!/usr/bin/env sh

mkdir -p out
typst watch src/main.typ out/thesis.pdf --root $(pwd)
