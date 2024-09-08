{
    programs.hyprlock = {
        enable = true;
        settings = {
            hide_cursor = true;

            background = [
                {
                    path = "${../../../static/wallpaper.png}";
                    blur_passes = 4;
                    blur_size = 2;
                }
            ];

            label = [
                {
                    text = ''<b>Quixadá ☀️ | 37° C</b>'';
                    text_align = "center";
                    color = "rgba(255, 255, 255, 1.0)";
                    font_size = 13;
                    font_family = "FiraCode Nerd Font Mono";
                    valign = "top";
                    halign = "center";
                    position = "0, -20";
                }
                {
                    text = ''cmd[update:1000] echo -e "$(date +"%H")"'';
                    text_align = "center";
                    color = "rgba(255, 255, 255, 1.0)";
                    font_size = 150;
                    font_family = "Alpha Slab One";
                    valign = "center";
                    halign = "center";
                    position = "0, 85";
                }
                {
                    text = ''cmd[update:1000] echo -e "$(date +"%M")"'';
                    text_align = "center";
                    color = "rgba(255, 255, 255, 1.0)";
                    font_size = 150;
                    font_family = "Alpha Slab One";
                    valign = "center";
                    halign = "center";
                    position = "0, -85";
                }
                {
                    text = ''cmd[update:1000] echo -e "<b>$(date +"%d %b, %A")</b>"'';
                    text_align = "center";
                    color = "rgba(255, 255, 255, 1.0)";
                    font_size = 13;
                    font_family = "FiraCode Nerd Font Mono";
                    valign = "center";
                    halign = "center";
                    position = "0, -180";
                }
            ];
        };
    };
}