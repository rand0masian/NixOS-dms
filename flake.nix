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

        PINCE = {
            url = "https://github.com/korcankaraokcu/PINCE/releases/download/v0.5/PINCE-x86_64.AppImage";
            flake = false;
        };

        flake-parts.url = "github:hercules-ci/flake-parts";
        import-tree.url = "github:vic/import-tree";
        wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
    };

    outputs = inputs: inputs.flake-parts.lib.mkFlake
        {inherit inputs;}
        (inputs.import-tree ./hosts);
}
