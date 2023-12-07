{ hostname, username, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./battery.nix
  ];

  services.xserver = {
    layout = "br";
    xkbVariant = "abnt2";
  };

  # ---- System Configurations ----
  # Enable my Lenovo Keyboard
  boot.kernelParams = [ "i8042.direct" "i8042.dumbkbd" "i915.force_probe=9a49"];
  # ---- System Configurations ----
}
