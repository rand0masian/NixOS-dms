{ config, pkgs, inputs, ... }:

{
  # System Packages:
  environment.systemPackages = with pkgs; [
    pkgs.xwayland-satellite
    pkgs.sddm-astronaut
    pkgs.vscode
    kdePackages.polkit-kde-agent-1
    pkgs.firefox
    kdePackages.dolphin
    pkgs.kitty
    pkgs.fastfetch
    pkgs.fuzzel
    pkgs.mint-cursor-themes
    pkgs.git
    pkgs.unzip

    # Wallpapers.
    (pkgs.stdenv.mkDerivation {
      name = "Wallpapers";
      src = inputs.wallpapers;
      installPhase = ''
        mkdir -p $out/share/wallpapers
        cp -r . $out/share/wallpapers/
      '';
    }) 
  ];
}
