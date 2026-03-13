{ config, pkgs, inputs, ... }:

{
    nixpkgs.overlays = [
        (self: super: {
            wallpapers = self.callPackage ../pkgs/wallpapers.nix {
                inherit inputs;
            };
            neo-zen = self.callPackage ../pkgs/neo-zen.nix {
                inherit inputs;
            };
        })
    ];
}
