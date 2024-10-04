{ pkgs, inputs, ... }:

{
    programs.hyprland = {
        enable = true;
        package = inputs.hyprland.packages."x86_64-linux".hyprland;
        portalPackage = inputs.hyprland.packages."x86_64-linux".xdg-desktop-portal-hyprland;
        xwayland.enable = true;
    };

    security.pam.services.hyprlock = {};

    environment.systemPackages = with pkgs; [
        inputs.mcmojave-hyprcursor.packages.${pkgs.stdenv.hostPlatform.system}.default
        inputs.pyprland.packages."x86_64-linux".pyprland
    ];
}