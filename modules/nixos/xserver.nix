{ ... }:

{
    services.xserver = {
        enable = true;

        xkb = {
            layout = "br";
            variant = "";
        };

        videoDrivers = [ "amdgpu" ];
    };
}