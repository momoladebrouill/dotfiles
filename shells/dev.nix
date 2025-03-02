{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
    nativeBuildInputs = [
        pkgs.git

    ];
    shellHook = ''
    eval $(ssh-agent -s)
    ssh-add ~/.ssh/github
    '';
}
