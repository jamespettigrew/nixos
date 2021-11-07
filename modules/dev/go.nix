{ config, options, lib, pkgs, ... }:

with lib;
with lib.my;
let cfg = config.modules.dev.go;
in {
  options.modules.dev.go = {
    enable = mkBoolOpt false;
    enableGlobally = mkBoolOpt false;
  };

  config = mkIf cfg.enable (mkMerge [
    (mkIf cfg.enableGlobally {
      user.packages = [ pkgs.go ];
    })

    {
      env.GOPATH = "$XDG_DATA_HOME/go";
      env.PATH = [ "$GOPATH/bin" ];
    }
  ]);
}
