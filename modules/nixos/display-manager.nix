{ pkgs, ... }:

let
    where-is-my-sddm-theme = (pkgs.where-is-my-sddm-theme.override {
        variants = ["qt5"];
        themeConfig.General = {
            passwordFontSize = 72;
            passwordCursorColor = "#FFFFFF";
            hideCursor = true;
        };
    });
in
{
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        theme = "${where-is-my-sddm-theme}/share/sddm/themes/where_is_my_sddm_theme_qt5";
    };
}