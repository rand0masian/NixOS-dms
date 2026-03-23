{ config, pkgs, ... }:

{
    # Services:
     # sddm.
     services.displayManager.sddm = {
        enable = false;
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

     # Flatpak.
     services.flatpak = {
      enable = true;
     };

     # udev.
     services.udev = {
      extraRules = ''
         KERNEL=="event*", GROUP="input", MODE="0660"
         KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"
         KERNEL=="tty[0-9]*", GROUP="tty", MODE="0660"
      ''; 
     };
}
