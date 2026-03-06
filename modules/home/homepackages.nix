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
        
        # Heroic.
        (pkgs.heroic.override {
            extraPkgs = pkgs': with pkgs; [
                gamemode
            ];
        })

        # SillyTavern.
        (pkgs.stdenv.mkDerivation {
            name = "SillyTavern";
            src = inputs.SillyTavern;
            installPhase = ''
                mkdir -p $out/share/sillytavern
                cp -r . $out/share/sillytavern/
            '';
        })
    ];
}
