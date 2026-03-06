{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules/home/homeprograms.nix
    ./modules/home/homeservices.nix
    ./modules/home/homepackages.nix
  ];

  home.username = "randomasian";
  home.homeDirectory = "/home/randomasian";

  home.stateVersion = "25.11";

  home.file = {
    "/home/randomasian/.config/hypr/".source = ./hypr;
    "/home/randomasian/.config/DankMaterialShell/".source = ./DankMaterialShell;
    "./wallpapers".source = inputs.wallpapers;
  };

  programs.home-manager.enable = true;
}
