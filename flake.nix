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
        
	grub2-themes.url = "github:vinceliuice/grub2-themes";
        stylix.url = "github:danth/stylix";
        mcmojave-hyprcursor.url = "github:libadoxon/mcmojave-hyprcursor";
    };
    
    outputs = { nixpkgs, home-manager, stylix, grub2-themes, ... }@inputs: {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
                ./nixos/configuration.nix
                stylix.nixosModules.stylix
		grub2-themes.nixosModules.default
                home-manager.nixosModules.home-manager {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        users.hugo = import ./home-manager/home.nix;
                        extraSpecialArgs = { inherit inputs; };
                    };
                }
            ];
        };
    };
}
