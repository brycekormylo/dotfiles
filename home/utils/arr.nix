{pkgs, ...}: {
  home.packages = with pkgs; [
    clipgrab
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
