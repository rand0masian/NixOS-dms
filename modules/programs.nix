{ config, ... }:

{
    # Programs:
     # Hyprland Wayland Compositer.
     programs.hyprland = {
        enable = true;
     };

     # DankMaterialShell.
     programs.dms-shell = {
        enable = true;
     };

     # zsh.
     programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestions = {
            enable = true;
        };
        syntaxHighlighting = {
            enable = true;
        };
     };
}
