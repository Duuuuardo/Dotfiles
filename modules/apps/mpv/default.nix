{ pkgs, home-manager, username, ... }:
{
  home-manager.users.${username} = { pkgs, ... }: {
    home.packages = with pkgs; [
     mpv 
    ];

    programs = {
      mpv = {
        enable = true;
        bindings = {
          l = "seek  5";
          h = "seek -5";
          k = "seek  30";
          j = "seek -30";
          J = "cycle sub";
          K = "cycle sub down";
        };
        config = {
          force-window = true;
          osc = true;
          hwdec = "auto-safe";
          vo = "gpu";
          profile = "gpu-hq";
          gpu-context = "wayland";
          sub-border-size = 4.0;
          sub-shadow-color = "0.0/0.0/0.0";
          sub-shadow-offset = 1;
          sub-auto = "fuzzy";
          msg-level = "all=error";
          # ytdl-format = "bestvideo[height<=?1080]+bestaudio/best";
          ytdl-format = "best";
          save-position-on-quit = true;
          slang = "eng,en,Eng,English";
          alang = "br,en,eng";
          sub-font = "Impress BT";
          autofit = "50%";
          sub-font-size = "48";
          speed = "1.5";
        };
      };
    };
  };
}
