#!/usr/bin/env bash

function bcd(){
    cd $1
    if [[ -e $PWD/shell.nix ]]; then
        nix-shell
    fi
}
alias cd="bcd"
