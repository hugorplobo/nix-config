{ config, pkgs, inputs, ... }:

{
    home = {
        username = "hugo";
        homeDirectory = "/home/hugo";
        
        packages = with pkgs; [
            neofetch
            networkmanager_dmenu
            telegram-desktop
            discord
            swww
            zotero
            vscode-fhs
            jetbrains.webstorm
            jetbrains.idea-ultimate
            postman
            bat
        ];

        file.".config/nixpkgs/config.nix".text = ''
            {
                allowUnfree = true;
            }
        '';

        file.".config/networkmanager-dmenu/config.ini".text = ''
        	[dmenu]
	        dmenu_command = rofi -show run
        '';

        stateVersion = "24.05";
    };
    
    stylix.targets.waybar.enable = false;
    stylix.targets.rofi.enable = false;

    programs.obs-studio.enable = true;
    programs.nixvim.enable = true;
    programs.hyprlock.enable = true;
    programs.zoxide.enable = true;
    programs.zoxide.enableZshIntegration = true;
    programs.home-manager.enable = true;

    imports = [
        inputs.nixvim.homeManagerModules.nixvim
        ../../modules/home-manager/hyprland.nix
        ../../modules/home-manager/kitty.nix
        ../../modules/home-manager/swappy.nix
        ../../modules/home-manager/rofi.nix
        ../../modules/home-manager/waybar.nix
        ../../modules/home-manager/mako.nix
        ../../modules/home-manager/git.nix
        ../../modules/home-manager/zsh.nix
        ../../modules/home-manager/firefox.nix
    ];
}
