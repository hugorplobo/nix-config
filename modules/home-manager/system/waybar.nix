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
                    "tray"
                    "hyprland/workspaces"
                ];
                
                modules-center = [
		            "clock"
                ];
                
                modules-right = [
		            "network"
                    "backlight"
                    "wireplumber"
                    "battery"
                    "memory"
                    "cpu"
                ];
                
                "hyprland/workspaces" = {
                    format = "{icon}";
                };
                
                "tray" = {
                    spacing = 10;
                };

                "network" = {
                    interface = "wlp2s0";
                    format = "";
                    format-wifi = "  {essid}";
                };
                
                "backlight" = {
                    interval = 2;
                    format = "󰖨 {percent}%";
                };
                
                "wireplumber" = {
                    format = "{icon} {volume}%";
                    format-muted = "󰝟";
                    format-icons = ["" " " " " " " " "];
                    on-click = ''
                        mute=$(pamixer --get-mute);
                        if [[ "$mute" == "true" ]];
                            then pamixer -u;
                        else
                            pamixer -m;
                        fi
                    '';
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
                    interval = 60;
                    format = "{:%B %d, %H:%M}";
                    tooltip = false;
                };
            };
        };
        
        style = ''
            * {
                font-family: monospace;
                font-size: 13px;
		color: #${config.lib.stylix.colors.base05};
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
                background: #${config.lib.stylix.colors.base00};
            }

            #network {
                color: #${config.lib.stylix.colors.base08};
            }

            #backlight {
                color: #${config.lib.stylix.colors.base09};
            }

            #wireplumber {
                color: #${config.lib.stylix.colors.base0A};
            }

            #battery {
                color: #${config.lib.stylix.colors.base0B};
            }

            #memory {
                color: #${config.lib.stylix.colors.base0C};
            }

            #cpu {
                color: #${config.lib.stylix.colors.base0D};
            }

            #clock {
                padding: 0 15px;
            }

            #workspaces button.active * {
                color: #${config.lib.stylix.colors.base08};
            }
        '';
    };
}
