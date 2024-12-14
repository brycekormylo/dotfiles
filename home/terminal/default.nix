{pkgs, ...}: {
  home.packages = with pkgs; [
    croc
    fzf
    gotop
    hyperfine
    megacmd
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
