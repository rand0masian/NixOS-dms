{ config, pkgs, inputs, ... }:

{
    imports = [
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
    ];

    # Home Services:
     # Flatpak.
     services.flatpak = {
        enable = true;
        update.onActivation = true;
        uninstallUnmanaged = true;
        uninstallUnused = true;
        update.auto = {
            enable = true;
            onCalendar = "daily";
        };
        remotes = [
            {
                name = "flathub";
                location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
            }
        ];
        packages = [
            "runtime/org.gnome.Platform/x86_64/49"
            "com.github.tchx84.Flatseal"
            "org.vinegarhq.Sober"
            "io.github.celluloid_player.Celluloid"
            "com.interversehq.qView"
            "org.gnome.gitlab.YaLTeR.VideoTrimmer"
            "com.usebottles.bottles"
            "app.zen_browser.zen"
        ];
     };
     
      # systemd.
      systemd.user.services.flatpak-managed-install = {
        unitConfig = {
            StartLimitInterval = 0;
        };
        serviceConfig = {
            TimeoutStartSec = "5m";
        };
      };
}
