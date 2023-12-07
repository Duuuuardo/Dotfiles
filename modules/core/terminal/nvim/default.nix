{ pkgs, nixvim,  ... }:
{
  environment.systemPackages = with pkgs; [
    nixvim.packages.x86_64-linux.default
  ];
}
