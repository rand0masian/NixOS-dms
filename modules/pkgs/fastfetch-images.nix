{ stdenv, inputs, ... }:

stdenv.mkDerivation {
    pname = "fastfetch-images";
    version = "latest";
    srcs = [
        inputs.fastfetch-images-1;
        inputs.fastfetch-images-2;
    ];
    sourceRoot = ".";
    installPhase = ''
        mkdir -p $out/share/fastfetch-images
        cp -r . $out/share/fastfetch-images/
    '';
}
