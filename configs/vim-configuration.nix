{ pkgs, ... }:

pkgs.vim_configurable.customize {
   name = "vim";
  vimrcConfig = {
    packages.myVimPackages = with pkgs.vimPlugins; {
      start = [
        vim-nix
        vim-lastplace
        vim-snippets
        vim-mergetool
        vim-pandoc-syntax
        vim-wayland-clipboard
      ];
      opt = [];
    };
    
  };
}
