{ config, ... }:

let
    inherit (config.lib.stylix) colors;
in
{
    home.file.".local/share/rofi/themes/drun-theme.rasi".text = ''
        * {
            background-color: transparent;
            text-color: #${colors.base05};
        }

        element {
            padding: 8px 16px;
            spacing: 16px;
        }

        element selected normal {
            background-color: #${colors.base0D};
        }

        element-icon {
            size: 12px ;
            vertical-align: 0.50;
        }

        element-text {
            vertical-align: 0.50;
        }

        element-text selected normal {
            text-color: #${colors.base00};
        }

        entry {
            vertical-align: 0.50;
            placeholder: "Search...";
        }

        inputbar {
            padding: 16px;
            children: [ "entry" ];
        }

        listview {
            padding: 22px 0px 0px;
            columns: 1;
            scrollbar: true;
            lines: 8;
        }

        scrollbar {
            padding: 0px 5px ;
            width: 4px ;
            handle-width: 8px ;
            border: 0;
            handle-color: #${colors.base0D};
        }

        textbox {
            padding: 8px 24px;
        }

        window {
            fullscreen: true;
            background-color: #${colors.base00}CC;
            padding: 220px 30%;
            transparency: "real";
        }
    '';
}