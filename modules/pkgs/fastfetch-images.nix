{ stdenv, inputs, ... }:

stdenv.mkDerivation {
    pname = "fastfetch-images";
    version = "latest";
    srcs = [
        inputs.fastfetch-images-1
        inputs.fastfetch-images-2
    ];
    dontUnpack = true;
    sourceRoot = ".";
    installPhase = ''
        mkdir -p $out/share/fastfetch-images 
        sources=($srcs)
        cp "''${sources[0]}" $out/share/fastfetch-images/drowsy.webp
        cp "''${sources[1]}" $out/share/fastfetch-images/catgirl.jpg
    '';
}
