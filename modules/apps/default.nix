{ pkgs, home-manager, username, ... }:
{
  imports = [ 
    ./libreoffice
    ./vscode
  ];
  home-manager.users.${username} = { pkgs, ... }: {
    home.packages = with pkgs; [
      obsidian
      discord
     ];
  };
}
