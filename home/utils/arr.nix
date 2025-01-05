{pkgs, ...}: {
  home.packages = with pkgs; [
    clipgrab
    dolphin-emu
    element-desktop
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
