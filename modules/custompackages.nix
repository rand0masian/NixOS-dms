{ config, pkgs, inputs, ... }:

{
    # wallpapers.
    wallpapers-pkg = (
        pkgs.stdenv.mkDerivation {
            pname = "Wallpapers";
            src = inputs.wallpapers;
            installPhase = ''
                mkdir -p $out/share/wallpapers
                cp -r . $out/share/wallpapers/
            '';
        }
    );

    # neo-zen.
    neo-zen-pkg = (
        pkgs.stdenv.mkDerivation {
            pname = "neo-zen";
            src = inputs.neo-zen;
            installPhase = ''
                mkdir -p $out/share/neo-zen
                cp -r . $out/share/neo-zen/
            '';
        }
    );
}
