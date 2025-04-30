{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    git

    # lol
    fortune
    cowsay
    lolcat
  ];
    shellHook = ''
    fortune -s | cowsay -r | lolcat
    eval $(ssh-agent -s)
    ssh-add ~/.ssh/gitlab_ensimag
    '';
}
