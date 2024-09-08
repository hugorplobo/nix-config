{ pkgs, ... }:

{
    stylix = {
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-city-terminal-dark.yaml";
        image = ../../../static/wallpaper.png;
        opacity.terminal = 0.90;
        targets.waybar.enable = false;
        targets.rofi.enable = false;
    };
}