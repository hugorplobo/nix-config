{
    programs.hyprlock = {
        enable = true;
        settings = {
            background = [
                {
                    path = "${../../../static/wallpaper.png}";
                    blur_passes = 4;
                    blur_size = 2;
                }
            ];

            label = [
                {
                    text = "$TIME";
                    text_align = "center";
                    color = "rgba(255, 255, 255, 1.0)";
                    font_size = "128";
                    halign = "center";
                    valign = "center";
                    position = "0, 0";
                }
            ];
        };
    };
}