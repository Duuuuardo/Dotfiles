{ pkgs, home-manager, username, ... }:
{
  imports = [ 
    ./libreoffice
    ./vscode
    ./browsing
  ];
  home-manager.users.${username} = { pkgs, ... }: {
    home.packages = with pkgs; [
      obsidian
      discord
      bitwarden
      spotify-player
     ];
  };
}
