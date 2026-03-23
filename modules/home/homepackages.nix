{ config, pkgs, inputs, ... }:

{
    # Home Packages:
    home.packages = with pkgs; [
        pkgs.vesktop
        pkgs.protonvpn-gui
        pkgs.protonup-qt
        pkgs.flatpak
        pkgs.lutris
        pkgs.protontricks
        pkgs.whatsapp-electron
        pkgs.telegram-desktop
        inputs.zen-browser.packages.${pkgs.system}.default
        pkgs.neo-zen
        pkgs.starship
        pkgs.fastfetch-images
        pkgs.qbittorrent
        pkgs.PINCE
        
        # Heroic.
        (pkgs.heroic.override {
            extraPkgs = pkgs': with pkgs; [
                gamemode
            ];
        })
    ];
}
