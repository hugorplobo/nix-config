{ pkgs, inputs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ../../modules/nixos/docker.nix
        ../../modules/nixos/boot.nix
        ../../modules/nixos/network.nix
        ../../modules/nixos/audio.nix
        ../../modules/nixos/fonts.nix
        ../../modules/nixos/gaming.nix
        ../../modules/nixos/hyprland.nix
        ../../modules/nixos/xdg.nix
        ../../modules/nixos/bluetooth.nix
        ../../modules/nixos/locale.nix
        ../../modules/nixos/xserver.nix
        ../../modules/nixos/display-manager.nix
    ];

    system.stateVersion = "24.05";

    nix.settings = {
        experimental-features = [ "nix-command" "flakes" ];
        substituters = [ "https://hyprland.cachix.org" ];
        trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };

    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
    };

    nixpkgs.config.allowUnfree = true;
    
    environment.variables = {
        NIXOS_OZONE_WL = 1;
    };

    services.gvfs.enable = true;
    services.teamviewer.enable = true;

    console.keyMap = "br-abnt2";

    security.rtkit.enable = true;

    users.users.hugo = {
        isNormalUser = true;
        description = "Hugo Lobo";
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.zsh;
    };

    environment.systemPackages = with pkgs; [
        psmisc
        libnotify
        jmtpfs
        wl-clipboard
        cliphist
        grim
        slurp
        swappy
        vim
        wget
        kitty
        geany
        inputs.zen-browser.packages."x86_64-linux".specific
        pavucontrol
        nautilus
        brightnessctl
        pamixer
	    vlc
        libsForQt5.qt5.qtgraphicaleffects
	    btop
    ];

    programs.git.enable = true;
    programs.zsh.enable = true;
}
