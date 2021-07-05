{ config, options, lib, pkgs, my, ... }:

with lib;
with lib.my;
let cfg = config.modules.dev.dotnet;
in {
  options.modules.dev.dotnet = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    user.packages = with pkgs; [
      (with dotnetCorePackages; combinePackages [
        sdk_5_0
        sdk_3_1
      ])
    ];
  };
}
