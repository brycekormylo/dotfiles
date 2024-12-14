{pkgs, ...}: {
  home.packages = with pkgs; [
    clipgrab
    dolphin-emu
    jackett
    kiwix
    kiwix-tools
    libgen-cli
    nicotine-plus
    qbittorrent
    soulseekqt
    stash
  ];
}
