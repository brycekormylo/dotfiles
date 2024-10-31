{pkgs, ...}: {
  home.packages = with pkgs; [
    bottles
    lutris
    protonup-qt
    wine
    winetricks
  ];
}
