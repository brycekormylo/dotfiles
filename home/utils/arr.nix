{pkgs, ...}: {
  home.packages = with pkgs; [
    # clipgrab
    ytdownloader
    dolphin-emu
    # cemu
    # rar
    # element-desktop
    jackett
    kiwix
    kiwix-tools
    libgen-cli
    nicotine-plus
    qbittorrent
    # soulseekqt
    stash
    pipx
    streamrip
  ];
}
