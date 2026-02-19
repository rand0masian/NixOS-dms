{ config, pkgs, ...}:

{
    # Home Packages:
    home.packages = [
        pkgs.vesktop
        pkgs.protonvpn-gui
        pkgs.protonup-qt
        pkgs.flatpak
        pkgs.lutris
        
        # Heroic.
        (pkgs.heroic.override {
            extraPkgs = pkgs': with pkgs; [
                gamemode
            ];
        })
    ];
}
