{ pkgs, home-manager, username, ... }:
{  
   imports = [
    ./bash
    ./cava
    ./fonts
    ./kitty
    ./starship
    ./tmux
   ];

   # ---- System Configuration ----
   programs = {
     htop.enable = true;
     mtr.enable = true;  
   };

   environment.systemPackages = with pkgs; [
     btop
     nitch
   ];
}
