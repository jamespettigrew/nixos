{ config, options, pkgs, lib, my, ... }:

with lib;
with lib.my;
let cfg = config.modules.services.openfortivpn;
in {
  options.modules.services.openfortivpn = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    user.packages = with pkgs; [
      openfortivpn
    ];
    services.transmission = {
      enable = true;
    };
  };
}
