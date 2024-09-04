{ pkgs, ... }:

{
  home.packages = with pkgs; [
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
}