{pkgs,lib, ... }:
let mignons = pkgs.fetchFromGitHub
{
    "owner"= "hashirsajid58200p";
    "repo"= "minions-grub-theme";
    "rev"= "a11fe8835bf8a156396efb602c143ca7fc9fc597";
    "hash"= "sha256-DiLV9be+GC6RmmgaM7LWuiVTClKqw6iteLALfmX1CQQ=";
};
in
{
	services.greetd = {
		enable = true;
		settings.default_session = {
			command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd niri";
			user = "greeter";
		};
	};
# Use the systemd-boot EFI boot loader.
	boot.loader = {
		systemd-boot.enable = true;
		efi.canTouchEfiVariables = true;
		grub.device = "nodev";
		#grub.efiSupport = true;
		grub.theme = mignons;
	};
	boot.supportedFilesystems = [ "ntfs" ];
	boot.kernel.sysctl = {
		"net.ipv4.conf.all.forwarding" = true;
		"net.ipv6.conf.all.forwarding" = true;
	};
}
