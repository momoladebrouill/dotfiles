{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    # connect to vpn
	openconnect
    expect

	zathura
    git

    # lol
    fortune
    cowsay
    lolcat
  ];
    shellHook = ''
    alias vpn="expect -f /home/rayou/a/vpn"
    fortune -s | cowsay -r | lolcat
    eval $(ssh-agent -s)
    ssh-add ~/.ssh/gitlab_ensimag
    '';
}
