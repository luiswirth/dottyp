#!/usr/bin/env sh

mkdir -p out
typst watch src/main.typ out/paper.pdf --root $(pwd)
