{pkgs, ...}: {
  home.packages = with pkgs; [
    bat
    fd
    imgp
    ripgrep
    unzip
    wget
    xdragon
    xidel
    zip
    acpi

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
