{ options, config, lib, pkgs, ... }:

with lib;
with lib.my;
let cfg = config.modules.desktop.term.alacritty;
  configDir = config.dotfiles.configDir;
in {
  options.modules.desktop.term.alacritty = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    user.packages = with pkgs; [
      alacritty
      (makeDesktopItem {
        name = "alacritty";
        desktopName = "Alacritty";
        genericName = "Default terminal";
        icon = "utilities-terminal";
        exec = "${alacritty}/bin/alacritty";
        categories = "Development;System;Utility";
      })
    ];

    home.configFile = {
      "alacritty.yml".source = "${configDir}/alacritty/alacritty.yml";
    };
  };
}
