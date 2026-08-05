#!/usr/bin/env sh
# Copies a template out into a repository of its own, with dottyp vendored as a
# submodule under lib/. Given --private or --public it also creates the GitHub
# remote and enables Pages, which is what makes the deploy workflow the template
# carries do anything. A Pages site is public either way, so --private hides the
# sources and publishes the PDF.
# Usage: ./templates/new.sh <thesis|paper|notes> <path> [--private|--public]

set -e

usage() {
  echo "usage: $0 <thesis|paper|notes> <path> [--private|--public]" >&2
  exit 1
}

here=$(dirname "$0")
kind=$1
dest=$2
visibility=$3
[ -d "$here/$kind" ] && [ -n "$dest" ] || usage
case "$visibility" in
  "" | --private | --public) ;;
  *) usage ;;
esac
if [ -e "$dest" ]; then
  echo "$dest exists" >&2
  exit 1
fi

# What git tracks is what the template is, so build output never travels along.
mkdir -p "$dest"
git -C "$here" archive HEAD "$kind" | tar -x --strip-components=1 -C "$dest"

cd "$dest"
name=$(basename "$PWD")

# The document is published under the name of its repository.
workflow=.github/workflows/typst-deploy.yml
sed "s|src/main.typ document.pdf|src/main.typ $name.pdf|" "$workflow" > "$workflow.new"
mv "$workflow.new" "$workflow"

git init -q
git submodule add -q https://github.com/luiswirth/dottyp lib/dottyp
git add -A
git commit -qm "start from the dottyp $kind template"

./build.sh

if [ -n "$visibility" ]; then
  gh repo create "$name" "$visibility" --source=. --remote=origin --push
  # Pages has to exist before the first run, which would otherwise fail in its
  # deploy step with nothing to deploy to.
  slug=$(gh repo view --json nameWithOwner -q .nameWithOwner)
  gh api -X POST "repos/$slug/pages" -f build_type=workflow >/dev/null
fi
