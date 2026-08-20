{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {nixpkgs, ...}: let
    forEachSystem = f:
      nixpkgs.lib.genAttrs ["aarch64-darwin" "x86_64-linux"]
      (system: f nixpkgs.legacyPackages.${system});
  in {
    formatter = forEachSystem (pkgs: pkgs.alejandra);

    devShells = forEachSystem (pkgs: {
      default = pkgs.mkShell {
        packages = with pkgs; [typst tinymist];

        # The library under development is the checkout, never a pinned copy of
        # it, so the package root is the one beside this flake.
        shellHook = ''export TYPST_PACKAGE_PATH="$PWD/pkg"'';
      };
    });
  };
}
