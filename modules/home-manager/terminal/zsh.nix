{ config, ... }:

{
    programs.zsh = {
        enable = true;
        autocd = true;

        shellAliases = {
            web = "webstorm &> /dev/null &";
            idea = "idea-ultimate &> /dev/null &";
            buildn = "sudo nixos-rebuild switch --flake ~/nix#default";
            buildh = "home-manager switch --flake ~/nix#hugo";
            build = "buildh && buildn";
        };

        antidote = {
            enable = true;
            plugins = [
                "romkatv/powerlevel10k"
                "zsh-users/zsh-syntax-highlighting"
                "zsh-users/zsh-autosuggestions"
                "ohmyzsh/ohmyzsh path:plugins/sudo"
                "ohmyzsh/ohmyzsh path:plugins/magic-enter"
                "zpm-zsh/colorize"
                "zpm-zsh/colors"
                "Freed-Wu/zsh-help"
                "hlissner/zsh-autopair"
                "MichaelAquilina/zsh-auto-notify"
                "arzzen/calc.plugin.zsh"
            ];
        };

        initExtraFirst = ''
            if [[ -r "${config.home.homeDirectory}/.cache/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
                source "${config.home.homeDirectory}/.cache/p10k-instant-prompt-''${(%):-%n}.zsh"
            fi
        '';

        initExtra = ''
            [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
            autoload -U up-line-or-beginning-search
            autoload -U down-line-or-beginning-search
            zle -N up-line-or-beginning-search
            zle -N down-line-or-beginning-search
            bindkey ''$key[Up] up-line-or-beginning-search
            bindkey ''$key[Down] down-line-or-beginning-search
        '';
    };
}
