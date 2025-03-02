# Bashrc of momoladebrouill

# Source some routines to show batery statys or to change wifi connections via nmcli
source ~/shscripts/battery.bash
source ~/shscripts/wifi.bash
source ~/shscripts/better-cd.bash
source ~/shscripts/gray.bash


#to have a better navigation
set -o vi 
# alias rstudio="/home/rayou/rstudio/rmarkdown"
alias feh="feh -d. --draw-tinted"
alias rm="rm -i"

function nix-run() {
    nix-shell -p $1 --run $1
}
export PROMPT_COMMAND='nested=$(ps)'
export PS1="\r\n\033[0;33mNixOS \u @ \w\r\n$ \033[0;0m"

export NIX_SHELL_PRESERVE_PROMPT=1
export EDITOR=vim
if  [[ -n "$IN_NIX_SHELL" ]]; then
PS1="$(~/shscripts/prompt.sh)"
fi
