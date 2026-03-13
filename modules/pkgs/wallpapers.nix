{ stdenv, inputs, ... }:

stdenv.mkDerivation {
    pname = "wallpapers";
    version = "latest";
    src = inputs.wallpapers;
    installPhase = ''
        mkdir -p $out/share/wallpapers
        cp -r . $out/share/wallpapers/
    '';
}
