#!/usr/bin/env nix-shell
#! nix-shell -i bash 
#! nix-shell -p bash wofi

# Prompt the user for a zsh command using wofi
cmd=$(wofi --dmenu --prompt="zsh command:")

echo Running : $cmd
zsh -c "source ~/.zshrc;$cmd"
# Only run if user entered something
# [ -n "$cmd" ] && foot -e zsh -c "$cmd"
