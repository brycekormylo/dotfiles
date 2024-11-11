{pkgs, ...}: {
  home.packages = with pkgs; [
    dolphin-emu
    clipgrab
    qbittorrent
    soulseekqt
    nicotine-plus
    jackett
  ];
}
