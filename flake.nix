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
        zen-browser.url = "github:MarceColl/zen-browser-flake";
        stylix.url = "github:danth/stylix";
        mcmojave-hyprcursor.url = "github:libadoxon/mcmojave-hyprcursor";
    };
    
    outputs = { nixpkgs, stylix, grub2-themes, home-manager, ... }@inputs:
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
        in
        {
            nixosConfigurations.default = nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = { inherit inputs; };
                modules = [
                    ./hosts/default/configuration.nix
                    stylix.nixosModules.stylix
                    grub2-themes.nixosModules.default
                    home-manager.nixosModules.home-manager {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            users.hugo = import ./hosts/default/home.nix;
                            extraSpecialArgs = { inherit inputs; };
                        };
                    }
                ];
            };
        };
}