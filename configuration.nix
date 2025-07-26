# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ./boot-configuration.nix
        ./store-configuration.nix
        ./graphical-configuration.nix
        ./apps-configuration.nix
        ];

    networking.hostName = "Catafalque"; 
    networking.networkmanager.enable = true; 

    # Set your time zone.
    time.timeZone = "Europe/Paris";
    i18n.extraLocaleSettings.LC_TIME="fr_FR.UTF-8";
    console = {
        font = "cascadia-code";
        keyMap = lib.mkForce "fr";
        useXkbConfig = true; #use xkb.options in tty.
    };

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.rayou = {
        isNormalUser = true;
        shell = pkgs.zsh;
        extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
            packages = with pkgs; [
                sl
            ];
    };


# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };


  services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;
  system.copySystemConfiguration = true;

    system.stateVersion = "24.11";
}
