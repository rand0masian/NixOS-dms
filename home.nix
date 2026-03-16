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
      source = config.lib.file.mkOutOfStoreSymlink "/home/randomasian/.configuration/hypr";
      force = true;
    };
    ".config/DankMaterialShell" = {
      source = config.lib.file.mkOutOfStoreSymlink "~/.DankMaterialShell";
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
