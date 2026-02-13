{ inputs, ...}: {

    flake = {
        
        nixosConfigurations = {
            nixos-home-personal = inputs.nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ../../configuration.nix
                ];
            };

        };
    };
}
