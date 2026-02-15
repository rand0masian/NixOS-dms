{ config, pkgs, inputs, ...}:

{
    # Home Packages:
    home.packages = [
        pkgs.vesktop
        pkgs.protonvpn-gui
        pkgs.protonup-qt

        # Heroic.
        (pkgs.heroic.override {
            extraPkgs = pkgs': with pkgs; [
                gamemode
            ];
        })
    ];
}
