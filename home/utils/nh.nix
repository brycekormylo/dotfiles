{
  programs.nh = {
    enable = true;
    flake = "/home/bryce/dot";
    # Alt to nixos gc
    # clean.enable = true;
    # clean.extraArgs = "--keep-since 4d --keep 3";
  };
}
