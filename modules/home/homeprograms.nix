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
                settings = {
                    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
                    "gfx.webrender.all" = true;
                    "layers.acceleration.force-enabled" = true;
                    "widget.wayland.enable" = 1;
                    "media.ffmpeg.vaapi.enabled" = true;
                    "media.rdd-ffmpeg.enabled" = true;
                    "widget.dmabuf.force-enabled" = true;
                };
                userChrome = ''
                    @import "${pkgs.neo-zen}/share/neo-zen/userChrome.css";

                    * { transition: none !important; }
                    :root {
                    --zen-blur-radius: 0px !important;
                    --zen-element-transitions: 0s !important;
                    }

                    * {
                       backdrop-filter: none !important;
                       box-shadow: none !important;
                    }

                    #TabsToolbar, #nav-bar, #sidebar-box {
                        background-color: var(--zen-colors-tertiary) !important;
                        opacity: 1 !important;
                        }
                '';
                userContent = ''
                    @import "${pkgs.neo-zen}/share/neo-zen/userContent.css";
                '';
            };
        };
     };

     # starship.
     programs.starship = {
        enable = true;
        enableZshIntegration = true;
        presets = [
            "tokyo-night" 
        ];
     };

     # fastfetch.
     programs.fastfetch = {
        enable = true;
        settings = {
            logo = {
                source = "${pkgs.fastfetch-images}/share/fastfetch-images/drowsy.webp";
                type = "kitty";
                width = 40;
                height = 21;
            };
            modules = [
                "title"
                "sepearator"
                "os"
                "host"
                "kernel"
                "uptime"
                "packages"
                "shell"
                "display"
                "wm"
                "terminal"
                "cpu"
                "gpu"
                "memory"
                "break"
                "colors"
            ];
        };
     };
}
