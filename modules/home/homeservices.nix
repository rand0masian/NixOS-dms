{ config, pkgs, inputs, ... }:

{
    imports = [
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
    ];

    # Home Services:
     # Flatpak Remotes.
     services.flatpak.remotes = [
         {
            name = "flathub";
            location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
         }
      ];

     # Flatpak Packages.
     services.flatpak.packages = [
        "com.usebottles.bottles"
        "com.github.tchx84.Flatseal"
        "org.vinegarhq.Sober"
     ];
}
