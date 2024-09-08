{ pkgs, ... }:

{
    programs.home-manager.enable = true;

    imports = [
        ./system
        ./desktop
        ./terminal
    ];
}
