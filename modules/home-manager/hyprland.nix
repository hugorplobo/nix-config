{ pkgs, config, ... }:

let
    startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
        systemctl --user start plasma-polkit-agent
        waybar &
        swww init &
        sleep 1
        swww img ${config.home.homeDirectory}/nix/static/wallpaper3.png
        wl-paste --type text --watch cliphist store
        wl-paste --type image --watch cliphist store
    '';
in
{
    wayland.windowManager.hyprland = {
        enable = true;
        settings = {
            "$mod" = "SUPER";
            "$terminal" = "kitty";
            "$browser" = "zen";
            "$menu" = "rofi -show drun";
            "$fileManager" = "nautilus";
            
            "exec-once" = ''${startupScript}/bin/start'';

            monitor = [",preferred,auto,auto"];

            env = [
                "XCURSOR_SIZE,32"
                "HYPRCURSOR_SIZE,32"
                "HYPRCURSOR_THEME,Vanilla-DMZ"
            ];

            general = {
                gaps_in = 5;
                gaps_out = 10;
                border_size = 2;
                resize_on_border = false;
                allow_tearing = false;
                layout = "dwindle";
            };

            decoration = {
                rounding = 10;
                active_opacity = 1.0;
                inactive_opacity = 1.0;
                drop_shadow = true;
                shadow_range = 4;
                shadow_render_power = 3;

                blur = {
                    enabled = true;
                    size = 3;
                    passes = 2;
                    vibrancy = 0.1696;
                };
            };

            animations = {
                enabled = true;
                bezier = ["myBezier, 0.05, 0.9, 0.1, 1.05"];
                animation = [
                    "windows, 1, 7, myBezier"
                    "windowsOut, 1, 7, default, popin 80%"
                    "border, 1, 10, default"
                    "borderangle, 1, 8, default"
                    "fade, 1, 7, default"
                    "workspaces, 1, 6, default"
                ];
            };

            dwindle = {
                pseudotile = true;
                preserve_split = true;
            };

            master = {
                new_status = "master";
            };

            misc = {
                force_default_wallpaper = 0;
                disable_hyprland_logo = true;
            };

            input = {
                kb_layout = "br";
                follow_mouse = 0;
                touchpad = {
                    natural_scroll = true;
                };
            };

            bind = [
                "$mod, Q, exec, $terminal"
                "$mod, C, killactive"
                "$mod, M, exit,"
                "$mod, E, exec, $fileManager"
                "$mod, V, togglefloating,"
                "$mod, R, exec, $menu"
                "$mod, W, exec, $browser"
                "$mod, P, pseudo,"
                "$mod, J, togglesplit,"
                "$mod, S, exec, grim -g \"$(slurp)\" - | swappy -f -"
                ", Print, exec, grim - | swappy -f -"
                "$mod, L, exec, hyprlock"
                "$mod, N, exec, networkmanager_dmenu"

                "$mod, 1, workspace, 1"
                "$mod, 2, workspace, 2"
                "$mod, 3, workspace, 3"
                "$mod, 4, workspace, 4"
                "$mod, 5, workspace, 5"
                "$mod, 6, workspace, 6"
                "$mod, 7, workspace, 7"
                "$mod, 8, workspace, 8"
                "$mod, 9, workspace, 9"
                "$mod, 0, workspace, 10"

                "$mod, left, movefocus, l"
                "$mod, right, movefocus, r"
                "$mod, up, movefocus, u"
                "$mod, down, movefocus, d"

                "$mod SHIFT, 1, movetoworkspace, 1"
                "$mod SHIFT, 2, movetoworkspace, 2"
                "$mod SHIFT, 3, movetoworkspace, 3"
                "$mod SHIFT, 4, movetoworkspace, 4"
                "$mod SHIFT, 5, movetoworkspace, 5"
                "$mod SHIFT, 6, movetoworkspace, 6"
                "$mod SHIFT, 7, movetoworkspace, 7"
                "$mod SHIFT, 8, movetoworkspace, 8"
                "$mod SHIFT, 9, movetoworkspace, 9"
                "$mod SHIFT, 0, movetoworkspace, 10"
            ];
            
            bindm = [
                "$mod, mouse:272, movewindow"
                "$mod, mouse:273, resizewindow"
            ];

            layerrule = [
                "blur, rofi"
                #"noanim, rofi"
            ];
        };
    };
}
