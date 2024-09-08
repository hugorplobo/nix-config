{ pkgs, inputs, ... }:

{
    programs.home-manager.enable = true;

    imports = [
        inputs.nixvim.homeManagerModules.nixvim
        ./system
        ./desktop
        ./terminal
    ];
}
