{ config, pkgs, inputs, ... }:

{
    imports = [
        inputs.spicetify-nix.homeManagerModules.default
        inputs.zen-browser.homeModules.twilight
    ];

    # Home Programs:
     # git.
     programs.git = {
        enable = true;
        userName = "randomasian";
        userEmail = "alfieroskell@outlook.com";
        extraConfig = {
            init.defaultBranch = "main";
        };
     };

     # spicetify.
     programs.spicetify =
     let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
      in 
        {
            enable = true;
            enabledExtensions = with spicePkgs.extensions; [
                adblock
                hidePodcasts
            ];
            enabledCustomApps = with spicePkgs.apps; [
                ncsVisualizer
            ];
            theme = spicePkgs.themes.retroBlur;
        };

     # OBS.
     programs.obs-studio = {
        enable = true;
        plugins = with pkgs.obs-studio-plugins; [
            wlrobs
            obs-backgroundremoval
            obs-pipewire-audio-capture
            obs-gstreamer
            obs-vkcapture
        ];
     };

     # zen-browser.
     programs.zen-browser = {
        enable = true;
        profiles = {
            default = {
                userChrome = ''
                    @import "${neo-zen-pkg}/share/neo-zen/userChrome.css";
                '';
                userContent = ''
                    @import "${neo-zen-pkg}/share/neo-zen/userContent.css";
                '';
            };
        };
     };
}
