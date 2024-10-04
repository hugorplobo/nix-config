{ pkgs, ... }:

{
    fonts.packages = with pkgs; [
        font-awesome
        texlivePackages.alfaslabone
        (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
}