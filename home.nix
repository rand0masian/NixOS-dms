{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules/home/homeprograms.nix
    ./modules/home/homeservices.nix
    ./modules/home/homepackages.nix
  ];

  home.username = "randomasian";
  home.homeDirectory = "/home/randomasian";

  home.file = {
    ".config/hypr" = {
      source = ./hypr;
      recursive = true;
      force = true;
    };
    ".config/DankMaterialShell" = {
      source = ./DankMaterialShell;
      recursive = true;
      force = true;
    };
    ".local/share/konsole" = {
      source = ./konsole;
      recursive = true;
      force = true;
    };
    ".config/konsolerc" = {
      source = ./konsole/konsolerc;
      force = true;
    };
    "./wallpapers" = {
      source = "${pkgs.wallpapers}/share/wallpapers";
      recursive = true;
      force = true;
    };
  };

  home.stateVersion = "25.11";

  home.sessionVariables = {
    DEFAULT_BROWSER = "zen-twilight";
  };

  programs.home-manager.enable = true;
}
