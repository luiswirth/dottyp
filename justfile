# Check that every test file still compiles.
ci:
    #!/usr/bin/env sh
    set -e
    nix fmt -- --ci
    pdfs="$(mktemp -d)"
    trap 'rm -rf "$pdfs"' EXIT
    for document in test/*.typ; do
      typst compile "$document" "$pdfs/$(basename "$document" .typ).pdf" --root "$PWD"
    done

# Watch one test file, named without its extension: just watch layout
watch name="showcase":
    mkdir -p out
    typst watch "test/{{ name }}.typ" "out/{{ name }}.pdf" --root "$PWD"
