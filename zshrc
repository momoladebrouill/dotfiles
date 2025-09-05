
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
source ~/shscripts/zathurals.bash
source ~/shscripts/current_shell.bash

#to have a better navigation
set -o vi 

#aliases
alias ls="ls --color=auto"
alias feh="feh -d. --draw-tinted"
alias rm="rm -i"
alias ns="nix-shell"


# specialy used for neofetch or discord
function nix-run() {
    nix-shell -p $1 --run $1
} 

function background(){
    if [[ -e $1 ]]; then 
        echo J\'ai mit $1 en fond d\'écran
        fullpath=$(readlink -f $1)
        swaymsg "output * bg $fullpath fill"
    else
        echo MMh t\' es sur frangin \?
    fi
}

colorgrid() {
    iter=16
    while [ $iter -lt 52 ]
    do
        second=$[$iter+36]
        third=$[$second+36]
        four=$[$third+36]
        five=$[$four+36]
        six=$[$five+36]
        seven=$[$six+36]
        if [ $seven -gt 250 ];then seven=$[$seven-251]; fi

        echo -en "\033[38;5;$(echo $iter)m█ "
        printf "%03d" $iter
        echo -en "   \033[38;5;$(echo $second)m█ "
        printf "%03d" $second
        echo -en "   \033[38;5;$(echo $third)m█ "
        printf "%03d" $third
        echo -en "   \033[38;5;$(echo $four)m█ "
        printf "%03d" $four
        echo -en "   \033[38;5;$(echo $five)m█ "
        printf "%03d" $five
        echo -en "   \033[38;5;$(echo $six)m█ "
        printf "%03d" $six
        echo -en "   \033[38;5;$(echo $seven)m█ "
        printf "%03d" $seven

        iter=$[$iter+1]
        printf '\r\n'
    done
}



export PROMPT_SUBST=1
export NIX_SHELL_PRESERVE_PROMPT=0

prompteur() {
    if  [[ -n "$IN_NIX_SHELL" ]]; then
        nested=$(echo $SHLVL | awk '{print $1 / 2 - 1}');
        export PROMPT=$'\n\033[38;5;002m NixSh (lvl:$nested) @ %~\n$ %f'
    else
        export PROMPT=$'\n\033[38;5;001m NixOS %n @ %~\n$ %f'
    fi
}

setopt prompt_subst
add-zsh-hook precmd prompteur
eval "$shellHook"
