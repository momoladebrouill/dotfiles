#!/usr/bin/env bash

function bcd(){
    cd $1
    if [[ -e $PWD/shell.nix ]]; then
        nix-shell --run zsh
    fi
}
alias c="bcd"
