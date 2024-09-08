{ pkgs, config, ... }:

let
    startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
        waybar &
        swww init &
        sleep 1
        swww img ${config.home.homeDirectory}/nix/static/wallpaper3.png
        wl-paste --type text --watch cliphist store
        wl-paste --type image --watch cliphist store
        systemctl --user start plasma-polkit-agent
        pypr
    '';
in
{
    wayland.windowManager.hyprland = {
        enable = true;
        settings = {
            "$mod" = "SUPER";
            "$terminal" = "kitty";
            "$browser" = "zen";
            "$menu" = "rofi -show drun -theme drun-theme";
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
                "$mod SHIFT, Q, exec, pypr toggle term"
                "$mod, X, exec, pypr menu power"

                ", XF86MonBrightnessUp, exec, value=$(brightnessctl g); brightnessctl s $(($value + 25))"
                ", XF86MonBrightnessDown, exec, value=$(brightnessctl g); brightnessctl s $(($value - 25))"
		        ", XF86AudioRaiseVolume, exec, pamixer -i 5"
		        ", XF86AudioLowerVolume, exec, pamixer -d 5"
                ", XF86AudioPlay, exec, playerctl play-pause"
                ", XF86AudioPrev, exec, playerctl previous"
                ", XF86AudioNext, exec, playerctl next"

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

            windowrulev2 = [
                "workspace 1, class:(kitty)"
                "workspace 2, class:(zen-alpha)"
                "workspace 3, class:(org.gnome.Nautilus)"
                "workspace 4, class:(jetbrains-idea)"
                "workspace 5, class:(Zotero)"
                "workspace 6, class:(org.telegram.desktop)"
                "workspace 6, class:(discord)"
            ];

            layerrule = [
                "blur, rofi"
            ];
        };
    };
}
