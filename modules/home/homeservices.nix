{ config, pkgs, inputs, ... }:

{
    imports = [
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
    ];

    # Home Services:
     # Flatpak.
     services.flatpak = {
        enable = true;
     };

      # Flatpak Packages.
     services.flatpak.packages = [
        "com.usebottles.bottles"
        "com.github.tchx84.Flatseal"
        "org.vinegarhq.Sober"
     ];
}
