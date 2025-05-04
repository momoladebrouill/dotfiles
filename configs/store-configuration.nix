
{ config, lib, pkgs, ... }:
{
# Optionally, you can set the size of the Nix store cache
    nix.gc = {
        automatic = true;
        dates = "monthly";
        options = "--delete-older-than 30d";
    };
    nixpkgs.config.allowUnfree = true;
    nix.settings.keep-outputs = true;
    nix.settings.keep-derivations = true;
    system.autoUpgrade.enable = true;
    nix.settings.auto-optimise-store = true;
}
