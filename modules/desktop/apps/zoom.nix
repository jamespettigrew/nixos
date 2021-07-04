{ config, options, lib, pkgs, ... }:

with lib;
with lib.my;
let cfg = config.modules.desktop.apps.zoom;
in {
  options.modules.desktop.apps.zoom = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    boot.extraModulePackages = with unstable; [
      config.boot.kernelPackages.v4l2loopback
    ];

    # Register a v4l2loopback device at boot
    boot.kernelModules = [
      "v4l2loopback"
    ];

    boot.extraModprobeConfig = ''
      options v4l2loopback exclusive_caps=1 video_nr=20 card_label=v4l2loopback
    '';

    user.packages = with pkgs; [
      v4l-utils
      zoom-us
    ];
  };
}
