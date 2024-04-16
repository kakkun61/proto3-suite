{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        compiler = "ghc94";
      in
        {
          devShell = pkgs.mkShell {
            buildInputs = with pkgs; [
              haskell.compiler.${compiler}
              zlib.dev
              zlib.out
              haskell.packages.${compiler}.haskell-language-server
            ];
          };
        });
}
