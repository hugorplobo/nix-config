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
                    format-icons = {
                        active = "";
                        default = "○︎︎";
                    };
                    persistent-workspaces = {
                        "*" = [1 2 3 4 5 6 7 8 9 10];
                    };
                };
                
                "tray" = {
                    spacing = 10;
                };

		"network" = {
		    interface = "wlp2s0";
		    format = "{ifname}";
		    format-wifi = "  {essid}";
		};
                
                "backlight" = {
                    interval = 2;
                    format = "󰖨 {percent}%";
                };
                
                "wireplumber" = {
                    format = "{icon} {volume}%";
                    format-muted = "󰝟";
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

            #network {
                color: #${config.lib.stylix.colors.base08};
            }

            #backlight {
                color: #${config.lib.stylix.colors.base09};
            }

            #pipewire {
                color: #${config.lib.stylix.colors.base0B};
            }

            #battery {
                color: #${config.lib.stylix.colors.base0C};
            }

            #memory {
                color: #${config.lib.stylix.colors.base0D};
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
