{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    treefmt-nix,
    ...
  }: let
    forEachSystem = f:
      nixpkgs.lib.genAttrs ["aarch64-darwin" "x86_64-linux"]
      (system: f nixpkgs.legacyPackages.${system});

    # One environment, entered by the shell and by the checks alike.
    tools = pkgs: with pkgs; [typst tinymist];

    # The library under development is the checkout, never a pinned copy of
    # it, so the package root is the one beside this flake.
    packagePath = ''export TYPST_PACKAGE_PATH="$PWD/pkg"'';
  in {
    # Typst is deliberately absent: a formatter there would undo the semantic
    # line breaks a document is written in.
    formatter = forEachSystem (pkgs:
      treefmt-nix.lib.mkWrapper pkgs {
        projectRootFile = "flake.nix";
        programs.alejandra.enable = true;
      });

    devShells = forEachSystem (pkgs: {
      default = pkgs.mkShell {
        packages = tools pkgs;
        shellHook = packagePath;
      };
    });

    apps = forEachSystem (pkgs: let
      app = name: text: {
        type = "app";
        program = nixpkgs.lib.getExe (pkgs.writeShellApplication {
          inherit name;
          runtimeInputs = tools pkgs;
          text = "${packagePath}\n${text}";
        });
      };
    in {
      # Everything CI runs, so that the same command answers for the library
      # locally. CI adds only `nix flake check`, which answers for the flake.
      #
      # A sheet names every export of its half, so a missing export and a name
      # that no longer exists both fail the compile. Nothing is kept: the
      # question is only whether the library still compiles.
      ci = app "ci" ''
        nix fmt -- --ci

        pdfs="$(mktemp -d)"
        trap 'rm -rf "$pdfs"' EXIT
        for document in test/*.typ; do
          typst compile "$document" "$pdfs/$(basename "$document" .typ).pdf" --root "$PWD"
        done
      '';

      # One test file, named without its extension: nix run .#watch -- layout
      watch = app "watch" ''
        mkdir -p out
        name="''${1:-showcase}"
        typst watch "test/$name.typ" "out/$name.pdf" --root "$PWD"
      '';
    });
  };
}
