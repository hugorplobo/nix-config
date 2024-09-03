{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    postgresql
    nodejs
    python3
    pipenv
    jdk17
    ngrok
  ];

  shellHook = ''
    sudo systemctl start docker.service;
    trap "sudo systemctl stop docker.service && sudo systemctl stop docker.socket" EXIT;
  '';
}
