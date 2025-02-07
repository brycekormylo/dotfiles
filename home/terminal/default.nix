{pkgs, ...}: {
  home.packages = with pkgs; [
    bash

    ffmpeg
    libpng
    mediainfo

    grim
    kooha
    slurp

    hyperfine
    megacmd

    croc
    imgp
    pciutils
    termshark

    tmpmail
    w3m
    xclip
    curl

    unzip
    zip

    bk
    pandoc

    acpi
    fastfetch
    gotop
    nvitop
    powertop
    tree
    zenith-nvidia 

    bat
    fd
    fzf
    jq
    ripgrep
    thefuck
    wget
    xdragon
    xidel
    zoxide
  ];

  imports = [
    ./kitty.nix
    ./mutt.nix
    ./ranger.nix
    ./tmux.nix
  ];
}
