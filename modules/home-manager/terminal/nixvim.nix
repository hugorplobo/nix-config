{ inputs, ... }:

{
    programs.nixvim = {
        enable = true;
        plugins = {
            lualine.enable = true;
            gitsigns.enable = true;
    	    toggleterm.enable = true;
        };

        opts = {
            number = true;
            relativenumber = true;
            shiftwidth = 4;
            signcolumn = "yes";
        };
    };

    imports = [
        inputs.nixvim.homeManagerModules.nixvim
    ];
}
