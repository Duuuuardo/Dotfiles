{ pkgs, username, ... }:
{  
  home-manager.users.${username} =  { ... }: {
    home.file = {
      ".config/tmux".source = ./config;
    };
  };

  # ---- System Configuration ----
  programs = {
    tmux = {
      enable = true;
      clock24 = true;
      newSession = true;
      plugins = with pkgs.tmuxPlugins; [ 
	catppuccin
	yank
      ];
    };
  };

}
