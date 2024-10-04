{
    description = "My system configuration";
    
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };

	hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

	hypr-darkwindow = {
	    url = "github:micha4w/Hypr-DarkWindow";
	    inputs.hyprland.follows = "hyprland";
	};

	Hyprspace = {
	    url = "github:KZDKM/Hyprspace";
	    inputs.hyprland.follows = "hyprland";
	};
        
        zen-browser.url = "github:MarceColl/zen-browser-flake";
        stylix.url = "github:danth/stylix";
        pyprland.url = "github:hyprland-community/pyprland";

        grub2-themes.url = "github:vinceliuice/grub2-themes";
        mcmojave-hyprcursor.url = "github:libadoxon/mcmojave-hyprcursor";

	ags.url = "github:aylur/ags/v2";
    };
    
    outputs = { nixpkgs, stylix, grub2-themes, home-manager, ... }@inputs:
        let
            username = "hugo";
            system = "x86_64-linux";
            pkgs = import nixpkgs {
                inherit system;
                config.allowUnfree = true;
            };
        in
        {
            nixosConfigurations.default = nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = { inherit inputs; };
                modules = [
                    ./hosts/default/configuration.nix
                    grub2-themes.nixosModules.default
                ];
            };

            homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                extraSpecialArgs = { inherit username inputs; };
                modules = [
                    stylix.homeManagerModules.stylix
                    ./hosts/default/home.nix
                ];
            };
        };
}
