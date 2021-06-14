{ config, options, lib, pkgs, ... }:

with lib;
with lib.my;
let cfg = config.modules.shell.saml2aws;
in {
  options.modules.shell.saml2aws = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    user.packages = [ pkgs.saml2aws ];
    modules.shell.zsh.rcInit = ''eval "$(saml2aws --completion-script-zsh)"'';
  };
}
