{ pkgs, inputs, ... }:

{
    perSystem = { config, pkgs, system, ... }:
     {
        packages.default = pkgs.buildNpmPackage {
            pname = "sillytavern";
            version = "latest";
            src = inputs.sillytavern;
            npmDepsHash = pkgs.lib.fakeHash;
            makeCacheWritable = true;
            dontNpmBuild = true;
            nativeBuildInputs = [ pkgs.makeWrapper ];
            installPhase = ''
                mkdir -p $out/opt/sillytavern
                cp -r . $out/opt/sillytavern/
                cat <<EOF > $out/bin/sillytavern
                #!/usr/bin/env bash
                ST_DATA="\$HOME/.local/share/sillytavern"
                mkdir -p "\$ST_DATA"

                for folder in public src scripts node_modules; do
                if [ ! -L "\$ST_DATA/\$folder" ]; then
                ln -s "$out/opt/sillytavern/\$folder" "\$ST_DATA/\$folder"
                fi
                done
                
                if [ ! -f "\$ST_DATA/config.yaml" ]; then
                cp "$out/opt/sillytavern/config.yaml" "\$ST_DATA/config.yaml"
                chmod +w "\$ST_DATA/config.yaml"
                fi

                cd "\$ST_DATA"
                exec ${pkgs.nodejs_25}/bin/node "$out/opt/sillytavern/server.js" "\$@"
                EOF

                chmod +x $out/bin/sillytavern
            '';
        };
    };
}
