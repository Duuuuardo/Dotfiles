{ pkgs, home-manager, username, ... }:
{  
   imports = [
    ./bash
    ./cava
    ./fonts
    ./kitty
    ./vim
    ./git
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
     eza
     fzf
     micro
     fd
     ripgrep
     most
     bat
     exa
     zoxide
     entr
     httpie
     ghq
   ];
}
