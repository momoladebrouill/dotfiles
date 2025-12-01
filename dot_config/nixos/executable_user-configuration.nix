{pkgs,...}:
{
	users.users.rayou = {
		isNormalUser = true;
		shell = pkgs.zsh;
		extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
	};
}
