#!/usr/bin/env sh

mkdir -p out
typst watch src/main.typ out/notes.pdf --root $(pwd)
