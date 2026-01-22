{pkgs, ...}: {
  home.packages = with pkgs; [
    # clipgrab
    dolphin-emu
    jackett
    kiwix
    kiwix-tools
    libgen-cli
    nicotine-plus
    pipx
    qbittorrent
    stash
    streamrip
    ytdownloader
  ];
}
