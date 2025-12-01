{ ... }: {
    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 1w";
    };
    nixpkgs.config.allowUnfree = true;
    nix.settings.keep-outputs = true;
    nix.settings.keep-derivations = true;
    nix.settings.auto-optimise-store = true;
    
		system.autoUpgrade.enable = false;
}
