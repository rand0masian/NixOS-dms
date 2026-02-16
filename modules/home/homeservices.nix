{ config, pkgs, inputs, ... }:

{
    imports = [
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
    ];

    # Home Services:
     # Flatpak.
     services.flatpak = {
        remotes = [
            {
                name = "flathub";
                location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
            }
        ];
        packages = [
            "runtime/org.gnome.Platform/x86_64/49"
            "com.usebottles.bottles"
            "com.github.tchx84.Flatseal"
            "org.vinegarhq.Sober"
            "org.gnome.Showtime"
        ];
     };
}
