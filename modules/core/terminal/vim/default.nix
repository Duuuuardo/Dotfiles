{ pkgs, ... }:
{  
  environment.systemPackages = with pkgs; [
     lunarvim
     lazygit
     prettierd
     eslint_d
  ];
}
