{pkgs, ...}: {
  home.packages = with pkgs; [
    bash
    bashdb

    ffmpeg
    libpng
    mediainfo

    grim
    kooha
    slurp

    hyperfine

    croc
    imgp
    pciutils
    termshark

    tcpdump
    filezilla

    tmpmail
    w3m
    xclip
    curl

    unzip
    zip

    bk
    pandoc

    acpi
    clinfo
    duf
    fastfetch
    gotop
    lshw
    nvitop
    powertop
    tree
    zenith-nvidia

    # Disk usage
    gdu

    # GPU
    mesa-demos

    bat
    fd
    fzf
    jq
    ripgrep
    # thefuck
    wget
    dragon-drop
    xidel
    zoxide
  ];

  imports = [
    ./kitty.nix
    ./lazygit.nix
    ./mutt.nix
    ./ranger.nix
    ./tmux.nix
    ./wezterm.nix
    # ./yazi.nix
  ];
}
