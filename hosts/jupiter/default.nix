{ pkgs, config, lib, ... }:
{
  imports = [
    ../home.nix
    ./hardware-configuration.nix
  ];

  ## Modules
  modules = {
    desktop = {
      bspwm.enable = true;
      apps = {
        discord.enable = true;
        keepass.enable = true;
        rofi.enable = true;
        zoom.enable = true;
      };
      browsers = {
        default = "firefox";
        firefox.enable = true;
      };
      dev = {
        datagrip.enable = true;
        postman.enable = true;
        rider.enable = true;
      };
      media = {
        documents.enable = true;
        graphics.enable = true;
        spotify.enable = true;
      };
      term = {
        default = "alacritty";
        alacritty.enable = true;
      };
    };
    dev = {
        dotnet.enable = true;
        go.enable = true;
        go.enableGlobally = true;
        rust.enable = true;
    };
    editors = {
      default = "nvim";
      emacs = {
        enable = true;
        doom.enable = true;
      };
      vim.enable = true;
    };
    shell = {
      #bitwarden.enable = true;
      direnv.enable = true;
      git.enable    = true;
      gnupg.enable  = true;
      saml2aws.enable = true;
      zsh.enable    = true;
    };
    services = {
      ssh.enable = true;
      docker.enable = true;
      openfortivpn.enable = true;
    };
    theme.active = "alucard";
  };

  # Provide headphone functionality
  systemd.user.services.bluetooth_headphones_autoconnect = {
    enable = true;
    description = "Automatically connects to Bluetooth headphones";
    requires = [ "bluetooth.service" ];
    after = [ "multi-user.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart="/run/current-system/sw/bin/bluetoothctl connect 00:1B:66:B4:58:4C";
    };
  };
  services.blueman.enable = true;
  systemd.user.services.mpris-proxy = {
    enable = true;
    description = "Mpris proxy";
    after = [ "network.target" "sound.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    };
    wantedBy = [ "default.target" ];
  };

  system.userActivationScripts.symbolic_link_downloads.text = ''
    if [[ ! -h "$HOME/Downloads" ]]; then
        ln -s "/misc/downloads" "$HOME/Downloads"
    fi
  '';

  ## Local config
  programs.ssh.startAgent = true;
  services.openssh.startWhenNeeded = true;

  networking.networkmanager.enable = true;
  # The global useDHCP flag is deprecated, therefore explicitly set to false
  # here. Per-interface useDHCP will be mandatory in the future, so this
  # generated config replicates the default behaviour.
  networking.useDHCP = false;
}
