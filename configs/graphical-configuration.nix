
{ config, lib, pkgs, ... }:

{
    # Enable the Wayland windowing system
    services.xserver.enable = false;

    # Enable Sway as the window manager
    programs.sway.enable = true;

    # Use seatd for input handling (recommended for Sway)
    security.pam.services.swaylock = {};

    # Disable the X11 display manager
    services.displayManager.sddm.enable = false;
    services.displayManager.defaultSession = "sway";

    # Configure keymap for Wayland (applies to Sway)
    services.xserver.xkb.layout = "fr";
    services.xserver.xkb.options = "eurosign:e,caps:escape";

    # Enable sound.
    services.pipewire = {
        enable = false;
        pulse.enable = true;
    };
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
          user = "greeter";
        };
      };
    };
    services.pulseaudio = {
        enable = true;
        package = pkgs.pulseaudioFull;
    };
    hardware.bluetooth.enable = true; # enables support for Bluetooth
    hardware.bluetooth.powerOnBoot = false; # powers up the default Bluetooth controller on boot
    # Enable touchpad support (enabled default in most desktopManager).
    services.libinput.enable = true;
}
