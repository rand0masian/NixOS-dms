{ config, pkgs, inputs, ... }:

{
    # Home Packages:
    home.packages = [
        pkgs.vesktop
        pkgs.protonvpn-gui
        pkgs.protonup-qt
        pkgs.flatpak
        pkgs.lutris
        pkgs.protontricks
        pkgs.whatsapp-electron
        pkgs.telegram-desktop
        inputs.sillytavern.packages.${pkgs.system}.default
        
        # Heroic.
        (pkgs.heroic.override {
            extraPkgs = pkgs': with pkgs; [
                gamemode
            ];
        })
    ];
}
