{ pkgs, ... }:

{
    home.packages = with pkgs; [
        telegram-desktop
        discord
        zotero
        vscode-fhs
        jetbrains.webstorm
        jetbrains.idea-ultimate
        postman
        wpsoffice
        qbittorrent
    ];

    programs.obs-studio.enable = true;
}