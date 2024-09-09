{ pkgs, lib, inputs, ... }:

let
    where-is-my-sddm-theme = (pkgs.where-is-my-sddm-theme.override {
        variants = ["qt5"];
        themeConfig.General = {
            passwordFontSize = 72;
            passwordCursorColor = "#FFFFFF";
            hideCursor = true;
        };
    });
in
{
    imports = [
        ./hardware-configuration.nix
    ];

    boot = {
        loader = {
            systemd-boot.enable = false;
            efi.canTouchEfiVariables = true;
            efi.efiSysMountPoint = "/boot";

            grub = {
                enable = true;
                device = "nodev";
                useOSProber = true;
                efiSupport = true;
            };

            grub2-theme = {
                enable = true;
                theme = "stylish";
                footer = true;
            };
        };
    };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    networking.hostName = "nixos";
    networking.networkmanager.enable = true;

    time.timeZone = "America/Fortaleza";

    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "pt_BR.UTF-8";
        LC_IDENTIFICATION = "pt_BR.UTF-8";
        LC_MEASUREMENT = "pt_BR.UTF-8";
        LC_MONETARY = "pt_BR.UTF-8";
        LC_NAME = "pt_BR.UTF-8";
        LC_NUMERIC = "pt_BR.UTF-8";
        LC_PAPER = "pt_BR.UTF-8";
        UTFLC_TELEPHONE = "pt_BR.UTF-8";
        LC_TIME = "pt_BR.UTF-8";
    };

    services.xserver = {
        enable = true;

        xkb = {
            layout = "br";
            variant = "";
        };

        videoDrivers = [ "amdgpu" ];
    };

    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        theme = "${where-is-my-sddm-theme}/share/sddm/themes/where_is_my_sddm_theme_qt5";
    };

    services.gvfs.enable = true;
    services.teamviewer.enable = true;

    security.pam.services.hyprlock = {};

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [
        pkgs.xdg-desktop-portal-gtk
    ];

    console.keyMap = "br-abnt2";

    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
    };

    security.rtkit.enable = true;
    services.playerctld.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
    };

    virtualisation.docker = {
        enable = true;
        enableOnBoot = false;
    };

    virtualisation.virtualbox.host.enable = true;

    users.groups.docker.members = [ "hugo" ];

    users.users.hugo = {
        isNormalUser = true;
        description = "Hugo Lobo";
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.zsh;
        packages = with pkgs; [];
    };

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        inputs.mcmojave-hyprcursor.packages.${pkgs.stdenv.hostPlatform.system}.default
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
        inputs.pyprland.packages."x86_64-linux".pyprland
        pavucontrol
        mangohud
        nautilus
        brightnessctl
        pamixer
	    vlc
        libsForQt5.qt5.qtgraphicaleffects
    ];

    environment.variables = {
        NIXOS_OZONE_WL = 1;
    };

    fonts.packages = with pkgs; [
        font-awesome
        texlivePackages.alfaslabone
        (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];

    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

    programs.git.enable = true;
    programs.zsh.enable = true;
    programs.gamemode.enable = true;

    programs.steam = {
        enable = true;
        gamescopeSession.enable = true;
    };

    system.stateVersion = "24.05";
}
