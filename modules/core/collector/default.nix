{ config, pkgs, ... }:
{
    systemd.services = {
     nix-collect-garbage = {
            description = "Remove NixOS generation older than 14 days";
            enable = false;
            path = [ pkgs.nix ];
            serviceConfig = {
                Type = "oneshot";
                ExecStart = "${pkgs.nix}/bin/nix-collect-garbage --delete-older-than 14d";
            };
        };
        nix-repair = {
            description = "Check and repair Nix store";
            enable = true;
            path = [ pkgs.nix ];
            serviceConfig = {
                Type = "oneshot";
                ExecStart = "${pkgs.nix}/bin/nix-store --verify --check-contents --repair";
            };
        };
    };
    systemd.timers = {
        nix-collect-garbage = {
            description = "Remove old NixOS generations";
            enable = false;
            timerConfig = {
                OnCalendar = "weekly";
                AccuracySec = "6h";
                Unit = "nix-collect-garbage.service";
                Persistent = true;
            };
            before = [ "fstrim.timer" ];
            wantedBy = [ "timers.target" ];
        };
        nix-repair = {
            description = "Check and repair Nix store";
            enable = true;
            timerConfig = {
                OnCalendar = "daily";
                AccuracySec = "6h";
                Unit = "nix-repair.service";
                Persistent = true;
            };
            before = [ "fstrim.timer" ];
            wantedBy = [ "timers.target" ];
        };
    };  
}