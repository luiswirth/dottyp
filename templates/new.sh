#!/usr/bin/env sh
# Copies a template out into a repository of its own, with dottyp vendored as a
# submodule under lib/. Usage: ./templates/new.sh <thesis|paper|notes> <path>

set -e

here=$(dirname "$0")
kind=$1
dest=$2
if [ ! -d "$here/$kind" ] || [ -z "$dest" ]; then
  echo "usage: $0 <thesis|paper|notes> <path>" >&2
  exit 1
fi
if [ -e "$dest" ]; then
  echo "$dest exists" >&2
  exit 1
fi

# What git tracks is what the template is, so build output never travels along.
mkdir -p "$dest"
git -C "$here" archive HEAD "$kind" | tar -x --strip-components=1 -C "$dest"

cd "$dest"
git init -q
git submodule add -q https://github.com/luiswirth/dottyp lib/dottyp
git add -A
git commit -qm "start from the dottyp $kind template"

./build.sh
