{ hostname, username, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  services.xserver = {
    layout = "en";
    xkbVariant = "intl";
  };

  environment.sessionVariables = rec {
    WLR_RENDERER_ALLOW_SOFTWARE  = 1;
  };
}
