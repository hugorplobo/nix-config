{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    postgresql
    nodejs
    jdk17
  ];

  shellHook = ''
    sudo systemctl start docker.service;
    trap "sudo systemctl stop docker.service && sudo systemctl stop docker.socket" EXIT;
  '';
}
