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
    tools = pkgs: with pkgs; [typst tinymist just];

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
        programs.just.enable = true;
      });

    devShells = forEachSystem (pkgs: {
      default = pkgs.mkShell {
        packages = tools pkgs;
        shellHook = packagePath;
      };
    });
  };
}
