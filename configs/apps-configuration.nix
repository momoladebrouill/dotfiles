
{ config, lib, pkgs, ... }:
let
  vimCustom = import ./vim-configuration.nix { inherit pkgs; };
in
{
    programs.firefox.enable = true;
    programs.zsh.enable = true;

    environment.systemPackages = with pkgs; [
        yazi # file explorer
        nix-bundle # for nix-run
        killall # must be available quickly
        vim_configurable
        git
        greetd.tuigreet

        # check status
        btop
        conky (conky.override { waylandSupport = true; })

        # cool programs (needs window environnement)
        swayfx
        brightnessctl
        zathura
        wayland-utils
        wl-clipboard
        wofi

        # cool terminal
        kitty
        zsh

        # music
        spotify
        bluez
        
    ];
    fonts.packages = with pkgs; [
      cascadia-code
      fira-code
    ];

    environment.variables = { EDITOR = "vim"; };
    environment.shellAliases = {
        nix-shell = "nix-shell --run zsh";
    };
}
