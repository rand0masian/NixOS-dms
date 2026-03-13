{ stdenv, inputs, ... }:

stdenv.mkDerivation {
    pname = "neo-zen";
    version = "latest";
    src = inputs.neo-zen;
    installPhase = ''
        mkdir -p $out/share/neo-zen
        cp -r . $out/share/neo-zen/
    '';
}
