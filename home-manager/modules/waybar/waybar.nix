{ config, ... }:

{
    programs.waybar = {
        enable = true;
        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                margin = "10 5 0 5";
                spacing = "10";
                
                modules-left = [
                    "clock"
                ];
                
                modules-center = [
                    "hyprland/workspaces"
                ];
                
                modules-right = [
                    "tray"
                    "backlight"
                    "wireplumber"
                    "battery"
                    "memory"
                    "cpu"
                ];
                
                "hyprland/workspaces" = {
                    format = "{icon}";
                    format-icons = {
                        active = "";
                        default = "○︎︎";
                    };
                    persistent-workspaces = {
                        "*" = [1 2 3 4 5 6 7 8];
                    };
                };
                
                "tray" = {
                    spacing = 10;
                };
                
                "backlight" = {
                    interval = 2;
                    format = "󰖨 {percent}%";
                };
                
                "wireplumber" = {
                    format = "{icon} {volume}%";
                    format-muted = "󰝟 ";
                    format-icons = ["" "" "" "" ""];
                };
                
                "battery" = {
                    interval = 10;
                    format = "{icon} {capacity}%";
                    format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
                    tooltip = true;
                    tooltip-true = "{timeTo}";
                };
                
                "memory" = {
                    interval = 5;
                    format = " {used}";
                    tooltip-format = "{used}GiB used of {total}GiB ({percentage}%)";
                };
                
                "cpu" = {
                    interval = 5;
                    format = " {usage}%";
                };
                
                "clock" = {
                    interval = 1;
                    format = "{:%B %d, %H:%M:%S}";
                    tooltip = false;
                };
            };
        };
        
        style = ''
            * {
                font-family: monospace;
                font-size: 13px;
            }

            window#waybar {
                background: transparent;
            }

            .modules-left, .modules-center, .modules-right {
                background: transparent;
                padding: 0 5px;
            }

            #clock,
            #battery,
            #cpu,
            #memory,
            #disk,
            #temperature,
            #backlight,
            #network,
            #pulseaudio,
            #wireplumber,
            #custom-media,
            #tray,
            #mode,
            #idle_inhibitor,
            #scratchpad,
            #power-profiles-daemon,
            #mpd,
            #workspaces {
                padding: 0 10px;
                margin: 0 2px;
                border-radius: 20px;
                background: #${config.lib.stylix.colors.base01};
            }

            #backlight {
                color: #${config.lib.stylix.colors.base08};
            }

            #pipewire {
                color: #${config.lib.stylix.colors.base09};
            }

            #battery {
                color: #${config.lib.stylix.colors.base0B};
            }

            #memory {
                color: #${config.lib.stylix.colors.base0C};
            }

            #cpu {
                color: #${config.lib.stylix.colors.base0E};
            }

            #clock {
                padding: 0 15px;
            }
        '';
    };
}
