{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    # connect to vpn
	openconnect
    expect

	zathura
    R
    git

    # lol
    fortune
    cowsay
    lolcat
  ];
    vpn = "expect -f /home/rayou/a/vpn";
    shellHook = ''
    fortune -s | cowsay | lolcat
	echo "$vpn pour le vpn"
    eval $(ssh-agent -s)
    ssh-add ~/.ssh/gitlab_ensimag
    '';
}
