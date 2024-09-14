{ inputs, ... }:

{
    programs.nixvim = {
        enable = true;
        plugins = {
            lualine.enable = true;
            gitsigns.enable = true;
    	    toggleterm.enable = true;
            oil.enable = true;
            fzf-lua.enable = true;
            lsp-format.enable = true;
            lspkind.enable = true;
            lspsaga.enable = true;
            neo-tree.enable = true;

            treesitter = {
                enable = true;
            };

            coq-nvim = {
                enable = true;
                settings = {
                    auto_start = true;
                    completion.always = true;
                };
            };

            lsp = {
                enable = true;
                inlayHints = true;
                servers = {
                    html.enable = true;
                    clangd.enable = true;
                    biome.enable = true;
                    java-language-server.enable = true;
                    nixd.enable = true;
                    rust-analyzer = {
			enable = true;
			installRustc = false;
			installCargo = false;
		    };
                };
            };
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
