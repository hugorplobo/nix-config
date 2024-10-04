{ ... }:

{
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
}