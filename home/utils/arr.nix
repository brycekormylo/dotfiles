{pkgs, ...}: {
  home.packages = with pkgs; [
    dolphin-emu
    jackett
    clipgrab
    qbittorrent
    soulseekqt
    nicotine-plus
    jackett
  ];
}
