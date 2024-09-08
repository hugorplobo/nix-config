{ pkgs, ... }:

{
    home.packages = with pkgs; [
        networkmanager_dmenu
        swww
    ];

    imports = [
        ./pyprland
        ./hyprland.nix
        ./hyprlock.nix
        ./mako.nix
        ./network-manager.nix
        ./nixpkgs.nix
        ./rofi.nix
        ./stylix.nix
        ./swappy.nix
        ./waybar.nix
    ];
}