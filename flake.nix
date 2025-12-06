{
  description = "My own dwl fork, as a flake";

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
      packages.${system} =
        let
          dwl-gravity = (pkgs.dwl.override { configH = ./config.h; }).overrideAttrs (old: {
            patches = (old.patches or [ ]) ++ [
              ./patches/bar/bar.patch
              ./patches/bar-appicons/bar-appicons.patch
            ];
          });
        in
        {
          dwl-gravity = dwl-gravity;
          default = dwl-gravity;
        };
    };
}
