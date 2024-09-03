{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "firefox-mod-blur";
  src = pkgs.fetchFromGitHub {
    owner = "datguypiko";
    repo = "Firefox-Mod-Blur";
    rev = "v2.9";
    hash = "sha256-41HyEMOtI0y+d250SNA+draZa9ISFb+2LxA3rHq6ZRw=";
  };

  installPhase = ''
    mkdir -p $out/theme;
    cp -r $src/* $out/theme;
  '';
}
