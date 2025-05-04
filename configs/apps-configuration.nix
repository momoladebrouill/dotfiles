
{ config, lib, pkgs, ... }:
{
    programs.firefox.enable = true;
    programs.zsh.enable = true;
    programs.vim.enable = true;

    environment.systemPackages = with pkgs; [
        yazi # file explorer
        nix-bundle # for nix-run
        killall # must be available quickly

        # to survive
        vim 

        # check status
        btop
        conky

        # cool programs (needs window environnement)
        swayfx
        brightnessctl
        zathura

        # cool terminal
        kitty
        zsh

        # music
        spotify
        bluez
        (conky.override { waylandSupport = true; })
        
        # VIM
        vim
        (
            (vim_configurable.override {  }).customize{
                name = "nvim";
                vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
                    start = [ vim-nix nvim-lastplace nvim-snippets ultisnips vim-mergetool vim-pandoc-syntax cmp-pandoc-nvim];
                opt = [];
                };
            }
        )
    ];

    environment.variables = { EDITOR = "vim"; };
    environment.shellAliases = {
        nix-shell = "nix-shell --run zsh";
    };
}
