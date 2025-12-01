{lib, ... }:

{
	imports =
		[ 
		./hardware-configuration.nix
			./boot-configuration.nix
			./store-configuration.nix
			./graphical-configuration.nix
			./apps-configuration.nix
			./user-configuration.nix
		];
	console = {
		keyMap = lib.mkForce "fr";
		useXkbConfig = true; #use xkb.options in tty.
	};
	networking.hostName = "Catafalque"; 
	system = {
		copySystemConfiguration = true;
		stateVersion = "25.05";
	};

	nix.settings.download-buffer-size = 524288000; # 500 MiB
	time.timeZone = "Europe/Paris";
	i18n.extraLocaleSettings.LC_TIME="fr_FR.UTF-8";

	services.udev.extraRules =''
		SUBSYSTEM=="usb", ATTR{idVendor}=="0483", ATTR{idProduct}=="a291", TAG+="uaccess"
		SUBSYSTEM=="usb", ATTR{idVendor}=="0483", ATTR{idProduct}=="df11", TAG+="uaccess"
		'';

}
