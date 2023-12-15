{ pkgs, username, ... }:
{  
  home-manager.users.${username} =  { ... }: {
    home.file = {
      ".config/nvim".source = ./config;
    };
  };
  environment.systemPackages = with pkgs; [
     lazygit
     prettierd
     eslint_d
     nvim
  ];
}
