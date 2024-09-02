{ config, ... }:

{
  home.file."${config.xdg.configHome}/swappy/config".text = ''
    [Default]
    save_dir=${config.home.homeDirectory}/pictures/screenshots
    early_exit=true
  '';
}
