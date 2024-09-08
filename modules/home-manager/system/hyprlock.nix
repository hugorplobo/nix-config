{
    programs.hyprlock = {
        enable = true;
        settings = {
            hide_cursor = true;

            background = [
                {
                    path = "${../../../static/wallpaper.png}";
                }
            ];

            image = [
                {
                    path = "${../../../static/wallpaper_nobg.png}";
                    size = 768;
                    rounding = 0;
                    border_size = 0;
                    valign = "center";
                    halign = "center";
                    position = "0, 0";
                    zindex = 10;
                    shadow_passes = 2;
                    shadow_size = 4;
                    shadow_boost = 0.5;
                }
            ];

            label = [
                {
                    text = ''cmd[update:1000] echo -e "$(date +"%H:%M")"'';
                    text_align = "center";
                    color = "rgba(255, 255, 255, 1.0)";
                    font_size = 160;
                    font_family = "Alpha Slab One";
                    valign = "center";
                    halign = "left";
                    position = "25, 0";
                }
                {
                    text = ''cmd[update:1000] echo -e "<b>$(date +"%d %b, %A")</b>"'';
                    text_align = "center";
                    color = "rgba(255, 255, 255, 1.0)";
                    font_size = 13;
                    font_family = "FiraCode Nerd Font Mono";
                    valign = "center";
                    halign = "left";
                    position = "35, -100";
                }
            ];
        };
    };
}