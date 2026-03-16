{
    inputs = {
        nixpkgs.url = "github:Nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        spicetify-nix.url = "github:Gerg-L/spicetify-nix";
        wallpapers = {
            url = "github:krishna4a6av/Wallpapers";
            flake = false;
        };

        nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
        dms = {
            url = "github:AvengeMedia/DankMaterialShell/stable";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        
        zen-browser = {
            url = "github:0xc000022070/zen-browser-flake/main";
            inputs = {
                nixpkgs.follows = "nixpkgs";
                home-manager.follows = "home-manager";
            };
        };

        neo-zen = {
            url = "github:JustVibingWhileCoding/Neo-Zen/main";
            flake = false;
        };

        fastfetch-images-1 = {
            url = "https://wallpapers.com/images/high/cute-anime-profile-pictures-hf5vd8c7ywpbvgvf.webp";
            flake = false;
        };

        fastfetch-images-2 = {
            url = "https://i.pinimg.com/736x/6f/90/ea/6f90eacec65e50b2b2f07178bedf8dd9.jpg";
            flake = false;
        };

        flake-parts.url = "github:hercules-ci/flake-parts";
    };

    outputs = inputs@{ flake-parts, ... }:
        flake-parts.lib.mkFlake { inherit inputs; } {
            systems = [
                "x86_64-linux"
            ];

            _module.args = {
                inherit (inputs) nixpkgs;
                inherit (inputs) home-manager;
                inherit (inputs) spicetify-nix;
                inherit (inputs) wallpapers;
                inherit (inputs) nix-flatpak;
                inherit (inputs) dms;
                inherit (inputs) zen-browser;
                inherit (inputs) neo-zen;
                inherit (inputs) fastfetch-images-1;
                inherit (inputs) fastfetch-images-2;
            }; 

            imports = [
                ./modules/flakes/nixos.nix
                ./modules/flakes/home-manager.nix
            ];
        };
}
