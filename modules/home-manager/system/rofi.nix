{ pkgs, config, ... }:

let
    inherit (config.lib.formats.rasi) mkLiteral;
    inherit (config.lib.stylix) colors;
in
{
    programs.rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        theme = {
            "*" = {
                background-color = mkLiteral "transparent";
                text-color = mkLiteral "#${colors.base05}";
            };

            "window" = {
                fullscreen = true;
                padding = mkLiteral "220px 30%";
                transparency = "real";
                background-color = mkLiteral "#${colors.base00}CC";
            };

            "inputbar" = {
                padding = mkLiteral "16px";
                children = map mkLiteral ["entry"];
            };

            "entry" = {
                placeholder = "Search...";
                vertical-align = mkLiteral "0.5";
            };

            "element-icon" = {
                size = mkLiteral "12px";
                vertical-align = mkLiteral "0.5";
            };

            "element-text" = {
                vertical-align = mkLiteral "0.5";
            };

            "textbox" = {
                padding = mkLiteral "8px 24px";
            };

            "element" = {
                padding = mkLiteral "8px 16px";
                spacing = mkLiteral "16px";
            };

            "element-text selected normal" = {
                text-color = mkLiteral "#${colors.base00}";
            };

            "element selected normal" = {
                background-color = mkLiteral "#${colors.base0D}";
            };

            "listview" = {
                lines = 8;
                columns = 1;
                padding = mkLiteral "22px 0 0";
                scrollbar = true;
            };

            "scrollbar" = {
                width = mkLiteral "4px";
                border = 0;
                handle-color = mkLiteral "#${colors.base0D}";
                handle-width = mkLiteral "8px";
                padding = mkLiteral "0 5px";
            };
        };
    };
}
