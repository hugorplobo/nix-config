{ pkgs, ... }:

let
    firefox-mod-blur = pkgs.callPackage ./firefox-mod-blur.nix {};
in
{
    programs.firefox = {
        enable = false;
        
        policies = {
            DefaultDownloadDirectory = "\${home}/Downloads";
        };

        profiles = {
            default = {
                id = 0;
	            name = "default";
	            isDefault = true;
            };
        };
    };

    home.file = {
        ".mozilla/firefox/default/chrome/userChrome.css".source = firefox-mod-blur + "/theme/userChrome.css";
        ".mozilla/firefox/default/chrome/userContent.css".source = firefox-mod-blur + "/theme/userContent.css";
        ".mozilla/firefox/default/chrome/acrylic_micaforeveryone.css".source = firefox-mod-blur + "/theme/acrylic_micaforeveryone.css";
        ".mozilla/firefox/default/chrome/ASSETS".source = firefox-mod-blur + "/theme/ASSETS";
    };
}
