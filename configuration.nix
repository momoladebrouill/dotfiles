# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ];

# Use the systemd-boot EFI boot loader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.grub.device = "nodev";
    boot.loader.grub.efiSupport = true;
    boot.kernel.sysctl = {
        "net.ipv4.conf.all.forwarding" = true;
        "net.ipv6.conf.all.forwarding" = true;
    };

# Optionally, you can set the size of the Nix store cache
    nix.gc = {
        automatic = true;
        dates = "monthly";
        options = "--delete-older-than 30d";
    };
    boot.supportedFilesystems = [ "ntfs" ];

    nixpkgs.config.allowUnfree = true;
    nix.settings.keep-outputs = true;
    nix.settings.keep-derivations = true;

    networking.hostName = "Catafalque"; # Define your hostname.
# Pick only one of the below networking options.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
        networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

# Set your time zone.
        time.timeZone = "Europe/Paris";

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Select internationalisation properties.
# i18n.defaultLocale = "en_US.UTF-8";
    console = {
        font = "Lat2-Terminus16";
        keyMap = lib.mkForce "fr";
        useXkbConfig = true; #use xkb.options in tty.
    };

    system.autoUpgrade.enable = true;
    nix.settings.auto-optimise-store = true;

# Enable the X11 windowing system.
    services.xserver.enable = true;
    services.xserver.windowManager.i3.enable = true;
    services.displayManager.sddm.enable = false;
    services.displayManager.defaultSession = "none+i3";

# Configure keymap in X11
    services.xserver.xkb.layout = "fr";
    services.xserver.xkb.options = "eurosign:e,caps:escape";
    services.xserver.autoRepeatDelay = 220;
    services.xserver.autoRepeatInterval = 60;

# Enable CUPS to print documents.
# services.printing.enable = true;

# Enable sound.
    services.pipewire = {
        enable = false;
        pulse.enable = true;
    };
    hardware.pulseaudio = {
        enable = true;
        package = pkgs.pulseaudioFull;
    };
    hardware.bluetooth.enable = true; # enables support for Bluetooth
        hardware.bluetooth.powerOnBoot = false; # powers up the default Bluetooth controller on boot


# Enable touchpad support (enabled default in most desktopManager).
        services.libinput.enable = true;

# Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.rayou = {
        isNormalUser = true;
        extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
            packages = with pkgs; [
                sl
            ];
    };

    programs.firefox.enable = true;
    programs.zsh.enable = true;
    programs.vim.enable = true;

# List packages installed in system profile. To search, run:
# $ nix search wget
    environment.systemPackages = with pkgs; [
        yazi # file explorer
        nix-bundle # for nix-run
        killall # must be available quickly

        # to survive
        vim 

        # check status
        btop
        i3status

        # cool i3
        feh
        brightnessctl
        i3blocks
        picom

        # cool terminal
        kitty
        zsh

        # music
        spotify
        bluez
        
        # VIM
        (
            (vim_configurable.override {  }).customize{
                name = "vim";
                vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
                    start = [ vim-nix vim-lastplace vim-snippets ultisnips vim-mergetool];
                opt = [];
                };
            }
        )
    ];

    environment.variables = { EDITOR = "vim"; };
    environment.shellAliases = {
        nix-shell = "nix-shell --run zsh";
  };


# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
    services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# Copy the NixOS configuration file and link it from the resulting system
# (/run/current-system/configuration.nix). This is useful in case you
# accidentally delete configuration.nix.
# system.copySystemConfiguration = true;

# This option defines the first version of NixOS you have installed on this particular machine,
# and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
#
# Most users should NEVER change this value after the initial install, for any reason,
# even if you've upgraded your system to a new NixOS release.
#
# This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
# so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
# to actually do that.
#
# This value being lower than the current NixOS release does NOT mean your system is
# out of date, out of support, or vulnerable.
#
# Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
# and migrated your data accordingly.
#
# For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
    system.stateVersion = "24.11"; # Did you read the comment?
}
