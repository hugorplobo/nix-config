{ pkgs, ... }:

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
        ./ranger.nix
        ./zsh.nix
    ];
}