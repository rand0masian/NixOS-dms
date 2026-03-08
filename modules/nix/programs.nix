{ config, inputs, ... }:

{
   imports = [
      inputs.dms.nixosModules.dank-material-shell
      inputs.dms.nixosModules.greeter
      inputs.wayland-vpets.nixosModules.default
   ];

    # Programs:
     # Hyprland Wayland Compositer.
     programs.hyprland = {
        enable = true;
     };

     # DankMaterialShell.
     programs.dank-material-shell = {
      enable = true;
      greeter = {
         enable = true;
         compositor = {
            name = "hyprland";
         };
         configHome = "/home/randomasian";
         configFiles = [
            "/home/randomasian/.configuration/DankMaterialShell/settings.json"
         ];
         logs = {
            save = true;
            path = "/tmp/dms-greeter.log";
         };
      };
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

     # Steam.
     programs.steam = {
      enable = true;
     };

     # GameMode
     programs.gamemode = {
      enable = true;
     };

     # wayland-vpets.
     programs.wayland-bongocat = {
      enable = true;
      autostart = true;
     };
}
