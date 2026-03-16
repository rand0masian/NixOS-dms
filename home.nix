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
      force = true;
    };
    ".config/DankMaterialShell" = {
      source = ./DankMaterialShell;
      force = true;
    };
    ".local/share/konsole" = {
      source = ./konsole;
      force = true;
    };
    ".config/konsolerc" = {
      source = ./konsole/konsolerc;
      force = true;
    };
    "$out/share/wallpapers" = {
      source = ./wallpapers;
      force = true;
    };
    "$out/share/neo-zen" = {
      source = ./neo-zen;
      force = true;
    };
    "$out/share/fastfetch-images" = {
      source = ./fastfetch-images;
      force = true;
    };
  };

  home.stateVersion = "25.11";

  home.sessionVariables = {
    DEFAULT_BROWSER = "zen-twilight";
  };

  programs.home-manager.enable = true;
}
