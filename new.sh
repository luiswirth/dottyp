#!/usr/bin/env sh
# Usage: ./new.sh <path> [--private|--public]
#
# The deployed site is public either way, so --private hides the sources and
# publishes the PDF.

set -e

usage() {
  echo "usage: $0 <path> [--private|--public]" >&2
  exit 1
}

here=$(dirname "$0")
dest=$1
visibility=$2
[ -n "$dest" ] || usage
case "$visibility" in
  "" | --private | --public) ;;
  *) usage ;;
esac
if [ -e "$dest" ]; then
  echo "$dest exists" >&2
  exit 1
fi

mkdir -p "$dest"
git -C "$here" archive HEAD template | tar -x --strip-components=1 -C "$dest"

cd "$dest"
name=$(basename "$PWD")

for file in justfile .github/workflows/typst-deploy.yml; do
  sed "s|document\.pdf|$name.pdf|" "$file" > "$file.new"
  mv "$file.new" "$file"
done

git init -q
git add -A
git commit -qm "start from the dottyp template"

nix develop --command just build

if [ -n "$visibility" ]; then
  gh repo create "$name" "$visibility" --source=. --remote=origin
  # The deploy authenticates with these, so they exist before the first push.
  gh secret set CLOUDFLARE_API_TOKEN < ~/secrets/cloudflare-ci-token.txt
  # The token reaches other people's accounts too, so pick mine by name.
  account_id=$(curl -s \
    -H "Authorization: Bearer $(cat ~/secrets/cloudflare-api-token.txt)" \
    https://api.cloudflare.com/client/v4/accounts |
    jq -er '.result[] | select(.name == "luiswirth") | .id')
  gh secret set CLOUDFLARE_ACCOUNT_ID --body "$account_id"
  git push -u origin HEAD
fi
