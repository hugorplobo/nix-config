{ pkgs, ... }:

{
    gtk = {
        enable = true;
        iconTheme = {
            name = "Adwaita";
#            package = pkgs.tokyonight-gtk-theme;
	    package = pkgs.adwaita-icon-theme;
        };
    };
}
