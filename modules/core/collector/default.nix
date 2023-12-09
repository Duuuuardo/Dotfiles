{ config, pkgs, ... }:
{
    nix.gc = {
        automatic = true;
        dates = "03:15";
        options = "-d"; 
    };
}