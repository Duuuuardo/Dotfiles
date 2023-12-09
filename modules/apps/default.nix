{ pkgs, home-manager, username, ... }:
{
  imports = [ 
    ./libreoffice
    ./vscode
    ./browsing
    ./mpv
  ];
  home-manager.users.${username} = { pkgs, ... }: {
    home.packages = with pkgs; [
      obsidian
      discord
      whatsapp-for-linux
      bitwarden
      spotify-player
     ];
  };
}
