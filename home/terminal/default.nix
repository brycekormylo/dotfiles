{pkgs, ...}: {
  home.packages = with pkgs; [
    bat
    powertop
    fd
    imgp
    ripgrep
    unzip
    wget
    xdragon
    xidel
    zip
    acpi

    ffmpeg
    ffmpegthumbnailer
    libpng
    lsix
    mediainfo
    ueberzugpp

    grim
    slurp
    kooha

    croc
    fzf
    gotop
    hyperfine
    megacmd
    nvitop
    pciutils
    rustplayer
    termshark
    thefuck
    tmpmail
    tree
    zoxide
  ];

  imports = [
    ./kitty.nix
    ./mutt.nix
    ./ranger.nix
    ./tmux.nix
  ];
}
