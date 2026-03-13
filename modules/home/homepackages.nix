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
        pkgs.neo-zen
        
        # Heroic.
        (pkgs.heroic.override {
            extraPkgs = pkgs': with pkgs; [
                gamemode
            ];
        })
    ];
}
