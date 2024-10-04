{ pkgs, ... }:

{
    home.packages = with pkgs; [
        networkmanager_dmenu
        swww
        rustup
	distrobox
    ];

    imports = [
        ./pyprland
        ./rofi
        ./ags
        ./hyprland.nix
        ./hyprlock.nix
        ./mako.nix
        ./network-manager.nix
        ./nixpkgs.nix
        ./stylix.nix
        ./swappy.nix
        ./waybar.nix
    ];
}
