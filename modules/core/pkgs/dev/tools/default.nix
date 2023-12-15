

{pkgs, ...}: {
  home.packages = with pkgs; [
    powershell
    postgresql_15
    railway
    thokr
    zig
  ];
}
