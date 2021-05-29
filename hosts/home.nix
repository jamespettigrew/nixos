{ config, lib, ... }:

with lib;
{
  ## Location config -- since Melbourne is my 127.0.0.1
  time.timeZone = mkDefault "Australia/Melbourne";
  i18n.defaultLocale = mkDefault "en_US.UTF-8";
  # For redshift, mainly
  location = (if config.time.timeZone == "Australia/Melbourne" then {
    latitude = -37.8136;
    longitude = 144.9631;
  } else {});

  # So thw bitwarden CLI knows where to find my server.
  modules.shell.bitwarden.config.server = "p.v0.io";
}
