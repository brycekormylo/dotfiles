{pkgs, ...}: {
  home.packages = with pkgs; [
    bottles
    discordo
    lutris
    protonup-qt
    wine
    winetricks
  ];
}
