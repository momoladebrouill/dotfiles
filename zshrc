
# The following lines were added by compinstall
zstyle :compinstall filename '/home/rayou/.zshrc'

autoload -Uz compinit
autoload -Uz add-zsh-hook
compinit
# End of lines added by compinstall
#
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# Bashrc of momoladebrouill

# Source some routines to show batery statys or to change wifi connections via nmcli
source ~/shscripts/battery.bash
source ~/shscripts/wifi.bash
source ~/shscripts/better-cd.bash
source ~/shscripts/gray.bash


#to have a better navigation
set -o vi 

alias ls="ls --color=auto"
alias feh="feh -d. --draw-tinted"
alias rm="rm -i"

# espiaccly used for neofetch or discord
function nix-run() {
    nix-shell -p $1 --run $1
} 

export PROMPT_SUBST=1
export NIX_SHELL_PRESERVE_PROMPT=0

prompteur() {
    if  [[ -n "$IN_NIX_SHELL" ]]; then
        nested=$(ps | wc -l | awk '{print $1 - 7}');
        export PROMPT=$'\n%F{magenta}nix-shell (${nested}) %n @ %~\n$ %f'
        #export PROMPT=$'\n%F{magenta}nix-shell genre(%{${nested}%}) %n @ %~\n$ %f';
    else
        export PROMPT=$'\n%F{yellow}NixOS %n @ %~\n$ %f'
    fi
}

setopt prompt_subst
add-zsh-hook precmd prompteur


