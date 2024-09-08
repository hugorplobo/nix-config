{ pkgs, config, ... }:

{
    programs.rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        theme = "drun-theme";
    };

    imports = [
        ./drun-theme.nix
    ];
}
