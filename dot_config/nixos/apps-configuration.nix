{pkgs, ... }:
let nixvim  = import ./nixvim.nix { inherit pkgs; };
in

let statusPackages= with pkgs; [
	btop
	conky (conky.override { waylandSupport = true; })
	wirelesstools
	killall # must be available quickly
]; in

let swayPackages = with pkgs; [ # I use sway for backup in case something doesn't work in niri
	swayfx
	swaybg
	i3status
	brightnessctl
]; in

let appsPackages = with pkgs; [
	spotify
	beeper
	discord
	ulauncher # launcher
	drawio # draw diagrams
	notesnook # note taking across multiple devices
	android-studio 
]; in 

let guisPackages = with pkgs; [
	zathura
	kitty
]; in

let tuisPackages = with pkgs; [
	bluetui
	lazygit # very cool for managing git
	yazi # file explorer
	tldr
	greetd.tuigreet
]; in

let basicPackages = with pkgs; [
	nix-bundle # for nix-run
	nixvim
	git
	unzip # used a lot
	direnv #usefull to save environnements
	shellify # use nix-shellify
	gnumake # usefull in many cases
	typst # yes I'm one of them
	chezmoi
	zsh
]; in

let waylandPackages = with pkgs; [
	wayland-utils
	wl-clipboard
	bluez
	xwayland-satellite # for running X11 things
]; in

{
	programs.firefox.enable = true;
	programs.zsh.enable = true;
	programs.localsend.enable = true;
	services.openssh.enable = true;
	networking.networkmanager.enable = true; 

	environment.systemPackages = 
		statusPackages 
		++ swayPackages
		++ appsPackages
		++ guisPackages
		++ tuisPackages
		++ basicPackages
		++ waylandPackages
		;

	fonts.packages = with pkgs; [
			nerd-fonts.fira-code
			nerd-fonts.droid-sans-mono
			open-sans
			hanken-grotesk
	];

	environment.variables = {
		EDITOR = "nvim";
	};

	environment.shellAliases = {
		nix-shell = "nix-shell --run zsh";
		ls="ls --color=auto";
		feh="feh -d. --draw-tinted";
		rm="rm -i";
		ns="nix-shell";
		nsc="nix-shellify";
		vim="nvim";
	};
}
