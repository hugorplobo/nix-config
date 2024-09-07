{ username, config, pkgs, inputs, ... }:

{
    home = {
        inherit username;
        homeDirectory = "/home/${username}";

        file.".config/networkmanager-dmenu/config.ini".text = ''
        	[dmenu]
	        dmenu_command = rofi -show run
        '';

	file.".config/nixpkgs/config.nix".text = ''
		{ allowUnfree = true; }
	'';

        stateVersion = "24.05";
    };

    stylix = {
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-city-terminal-dark.yaml";
        image = ../../static/wallpaper3.png;
        opacity.terminal = 0.90;
        targets.waybar.enable = false;
        targets.rofi.enable = false;
    };

    programs.obs-studio.enable = true;
    programs.nixvim.enable = true;
    programs.hyprlock.enable = true;
    programs.zoxide.enable = true;
    programs.zoxide.enableZshIntegration = true;
    programs.home-manager.enable = true;

    imports = [
        inputs.nixvim.homeManagerModules.nixvim
        ../../modules/home-manager/hyprland.nix
        ../../modules/home-manager/pyprland/pyprland.nix
        ../../modules/home-manager/kitty.nix
        ../../modules/home-manager/swappy.nix
        ../../modules/home-manager/rofi.nix
        ../../modules/home-manager/ranger.nix
        ../../modules/home-manager/waybar.nix
        ../../modules/home-manager/mako.nix
        ../../modules/home-manager/git.nix
        ../../modules/home-manager/zsh.nix
        ../../modules/home-manager/firefox.nix
        ../../modules/home-manager/packages.nix
    ];
}
