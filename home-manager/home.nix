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

  services.network-manager-applet.enable = true;

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./modules/hyprland.nix
    ./modules/kitty.nix
    ./modules/swappy.nix
    ./modules/rofi.nix
    ./modules/waybar.nix
    ./modules/mako.nix
    ./modules/git.nix
    ./modules/zsh.nix
    ./modules/firefox.nix
  ];
}
