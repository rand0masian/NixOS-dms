{ config, pkgs, inputs, ... }:

{
  # System Packages:
  environment.systemPackages = with pkgs; [
    pkgs.xwayland-satellite
    pkgs.sddm-astronaut
    pkgs.vscode
    kdePackages.polkit-kde-agent-1
    kdePackages.dolphin
    pkgs.kitty
    pkgs.fastfetch
    pkgs.fuzzel
    pkgs.mint-cursor-themes
    pkgs.git
    pkgs.unzip
    pkgs.wine-wayland
    pkgs.winetricks
    pkgs.cmake
    pkgs.rar
    pkgs.p7zip
    pkgs.pavucontrol
    pkgs.wallpapers
  ];
}
