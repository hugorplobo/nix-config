{ pkgs, inputs, ... }:

{
    home.packages = with pkgs; [
        neofetch
        bat
    ];

    programs.nixvim.enable = true;
    programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
    };

    imports = [
        ./git.nix
        ./kitty.nix
        ./nixvim.nix
        ./ranger.nix
        ./zsh.nix
    ];
}