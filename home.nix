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
    ./terminal
    ./utils

    ./colorscheme.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    docker
    neovide
    bash
    neofetch
    vscode
    nix-prefetch-github

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
