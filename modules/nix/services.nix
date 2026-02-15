{ config, pkgs, ... }:

{
    # Services:
     # sddm.
     services.displayManager.sddm = {
        enable = true;
        package = pkgs.kdePackages.sddm;
        theme = "sddm-astronaut-theme";
        extraPackages = with pkgs; [
            sddm-astronaut
            kdePackages.qtmultimedia
            kdePackages.qtsvg
            kdePackages.qtvirtualkeyboard
        ];
     };

     # polkit.
     security.polkit = {
        enable = true;
     };

     # Xorg + Wayland.
     services.xserver.displayManager.sddm.wayland = {
        enable = true;
     };
     services.xserver.videoDrivers = [
        "nvidia"
     ];
}
