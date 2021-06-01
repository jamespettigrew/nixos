{ config, options, lib, pkgs, ... }:

with lib;
with lib.my;
let cfg = config.modules.desktop.dev.rider;
in {
  options.modules.desktop.dev.rider = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    user.packages = with pkgs; [
      jetbrains.rider
    ];
  };
}
