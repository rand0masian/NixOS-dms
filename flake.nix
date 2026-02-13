{
    inputs = {
        nixpkgs.url = "github:Nixos/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager/master";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        flake-parts.url = "github:hercules-ci/flake-parts";
    };

    outputs = inputs@{ flake-parts, ... }:
        flake-parts.lib.mkFlake { inherit inputs; } {
            systems = [
                "x86_64-linux"
            ];

            _module.args = {
                inherit (inputs) home-manager;
                inherit (inputs) nixpkgs;
            };

            imports = [
                ./modules/flakes/nixos.nix
                ./modules/flakes/home-manager.nix
            ];
        };

}
