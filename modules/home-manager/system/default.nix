{ pkgs, ... }:

{
    home.packages = with pkgs; [
        networkmanager_dmenu
        swww
        rustup
    ];

    imports = [
        ./pyprland
        ./rofi
        
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