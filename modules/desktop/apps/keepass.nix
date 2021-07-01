{ config, options, pkgs, lib, my, ... }:

with lib;
with lib.my;
let cfg = config.modules.desktop.apps.keepass;
in {
  options.modules.desktop.apps.keepass = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    user.packages = with pkgs; [
      keepass
    ];
  };
}
