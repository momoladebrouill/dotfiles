{ pkgs, ... }:

{
# Enable the Wayland windowing system
	services.xserver.enable = false;
	programs.sway.enable = true;
	programs.niri.enable = true;

# Use seatd for input handling (recommended for Sway)
	security.pam.services.swaylock = {};

# Disable the X11 display manager
	services.displayManager.sddm.enable = false;
	services.displayManager.defaultSession = "niri";

	services.xserver.xkb.layout = "fr";
	services.xserver.xkb.options = "eurosign:e,caps:escape";

# Enable sound.
	services.pipewire = {
		enable = false;
		pulse.enable = true;
	};
	services.pulseaudio = {
		enable = true;
		package = pkgs.pulseaudioFull;
	};
	hardware.bluetooth.enable = true; # enables support for Bluetooth
		hardware.bluetooth.powerOnBoot = false; 
# Enable touchpad support (enabled default in most desktopManager).
	services.libinput.enable = true;
}
