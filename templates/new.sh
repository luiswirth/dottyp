#!/usr/bin/env sh
# Usage: ./templates/new.sh <thesis|paper|notes> <path> [--private|--public]
#
# A Pages site is public either way, so --private hides the sources and
# publishes the PDF.

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

mkdir -p "$dest"
git -C "$here" archive HEAD "$kind" | tar -x --strip-components=1 -C "$dest"

cd "$dest"
name=$(basename "$PWD")

for file in build.sh watch.sh .github/workflows/typst-deploy.yml; do
  sed "s|document\.pdf|$name.pdf|" "$file" > "$file.new"
  mv "$file.new" "$file"
done
# sed and mv drop the executable bit.
chmod +x build.sh watch.sh

git init -q
git submodule add -q https://github.com/luiswirth/dottyp lib/dottyp
git add -A
git commit -qm "start from the dottyp $kind template"

./build.sh

if [ -n "$visibility" ]; then
  gh repo create "$name" "$visibility" --source=. --remote=origin --push
  # Pages has to exist before the first run, which has nothing to deploy to
  # otherwise.
  slug=$(gh repo view --json nameWithOwner -q .nameWithOwner)
  gh api -X POST "repos/$slug/pages" -f build_type=workflow >/dev/null
fi
