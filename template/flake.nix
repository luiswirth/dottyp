{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    dottyp.url = "github:luiswirth/dottyp";
    dottyp.inputs.nixpkgs.follows = "nixpkgs";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    dottyp,
    treefmt-nix,
    ...
  }: let
    forEachSystem = f:
      nixpkgs.lib.genAttrs ["aarch64-darwin" "x86_64-linux"]
      (system: f nixpkgs.legacyPackages.${system});

    # One environment, entered by the shell and by the checks alike.
    tools = pkgs: with pkgs; [typst tinymist];

    packagePath = "${dottyp}/pkg";
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
        TYPST_PACKAGE_PATH = packagePath;
      };
    });

    # A build carries the library with it, so it never depends on the shell
    # having been entered, which is every non-interactive one.
    apps = forEachSystem (pkgs: let
      app = name: text: {
        type = "app";
        program = nixpkgs.lib.getExe (pkgs.writeShellApplication {
          inherit name;
          runtimeInputs = tools pkgs;
          text = ''
            export TYPST_PACKAGE_PATH="${packagePath}"
            ${text}
          '';
        });
      };
    in {
      build = app "build" ''
        mkdir -p out
        typst compile src/main.typ out/document.pdf --root "$PWD"
      '';

      watch = app "watch" ''
        mkdir -p out
        typst watch src/main.typ out/document.pdf --root "$PWD"
      '';

      # Everything CI runs, so that the same command answers for the document
      # locally. CI adds only `nix flake check`, which answers for the flake.
      # Nothing is kept: the question is only whether the document compiles.
      ci = app "ci" ''
        nix fmt -- --ci

        pdf="$(mktemp -d)"
        trap 'rm -rf "$pdf"' EXIT
        typst compile src/main.typ "$pdf/document.pdf" --root "$PWD"
      '';
    });
  };
}
