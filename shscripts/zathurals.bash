#/env/bin bash
#!nix-shell -p zathura

function zathuras(){
    for elem
    do
        zathura $elem
    done
}
