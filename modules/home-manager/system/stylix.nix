{ pkgs, ... }:

{
    stylix = {
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
        image = ../../../static/wallpaper.png;
        opacity.terminal = 0.90;
        targets.waybar.enable = false;
        targets.rofi.enable = false;
    };
}
