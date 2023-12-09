{ pkgs, ... }:
{ 
  programs.git = {
      enable = true;
      userName = "Duuuuardo";
      userEmail = "eduardofabisiak@proton.me";
      extraConfig = {
        credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
      };
    };
}
