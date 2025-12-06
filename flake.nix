{
  description = "My own dwl flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.${system}.dwl-gravity = pkgs.dwl.override { configH = ./config.h; };

      packages.${system}.default = self.packages.${system}.dwl-gravity;
    };
}
