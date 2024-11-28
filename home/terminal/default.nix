{pkgs, ...}: {
  home.packages = with pkgs; [
    tree
    gotop
    croc
    thefuck
    hyperfine
    termshark
    tmpmail
    fzf
    zoxide
  ];

  imports = [
    ./kitty.nix
    ./mutt.nix
    ./ranger.nix
    ./tmux.nix
  ];
}
