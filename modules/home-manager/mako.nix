{ lib, ... }:

{
    services.mako = {
        enable = true;
        defaultTimeout = 5000;
        maxVisible = 3;
        sort = "+time";

        font = lib.mkForce "monospace 10";
        borderRadius = 10;
        margin = "30";
    };
}
