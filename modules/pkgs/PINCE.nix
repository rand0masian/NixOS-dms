{ pkgs, inputs, ... }:

pkgs.appimageTools.wrapType2 {
    pname = "PINCE";
    version = "0.5";
    src = inputs.PINCE;
    extraPkgs = pkgs: with pkgs; [
        python3
        zstd
        libxcrypt-legacy
        libgcc.lib
        glib
        nss
        nspr
        dbus
        libdrm
        mesa
        libxkbcommon
        fontconfig
        freetype
        wayland
        xorg.libX11
        xorg.libXext
        xorg.libXrender 
        xorg.libXrandr
        xorg.libXcursor
        xorg.libXdamage
        xorg.libXfixes
        xorg.libXcomposite
        xorg.libXi 
        xorg.libXtst
        xorg.libxcb
        xorg.xcbutilwm
        xorg.xcbutilimage
        xorg.xcbutilkeysyms
        xorg.xcbutilrenderutil
        scanmem
        gdb
    ];
}
