{ config, options, lib, pkgs, ... }:

with lib;
with lib.my;
let cfg = config.modules.desktop.dev.datagrip;
in {
  options.modules.desktop.dev.datagrip = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    user.packages = with pkgs; [
      jetbrains.datagrip
    ];
  };
}
