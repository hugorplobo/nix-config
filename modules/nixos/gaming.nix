{ pkgs, ... }:

{
    programs.gamemode.enable = true;
    users.groups.gamemode.members = [ "hugo" ];

    programs.steam = {
        enable = true;
        gamescopeSession.enable = true;
	    extraCompatPackages = with pkgs; [ proton-ge-bin ];
    };

    environment.systemPackages = with pkgs; [
        mangohud
    ];
}