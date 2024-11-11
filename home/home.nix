{
  inputs,
  pkgs,
  ...
}: {
  home = {
    username = "bryce";
    homeDirectory = "/home/bryce";
    stateVersion = "24.11";
  };

  imports = [
    inputs.ags.homeManagerModules.default
    inputs.nix-colors.homeManagerModules.default

    ./git
    ./gui
    ./neovim
    ./shell
    ./terminal
    ./utils

    ./colorscheme.nix
  ];

  home.packages = with pkgs; [
    docker
    neovide
    bash
    neofetch
    vscode
    nix-prefetch-github
    jq

    diskonaut

    # PHOTOGRAPHY
    rawtherapee
    ansel

    # EDU
    mars-mips
    zulu
    gradle

    # READER
    bk
    pandoc
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  # Update plugins
  # cd .config/home-manager && nix flake update && home-manager switch
}
