{
  inputs,
  pkgs,
  ...
}: {
  home = {
    username = "bryce";
    homeDirectory = "/home/bryce";
    stateVersion = "25.05";
  };

  imports = [
    inputs.nix-colors.homeManagerModules.default

    ./git
    ./gui
    ./modules
    ./neovim
    ./shell
    ./terminal
    ./utils

    ./colorscheme.nix
  ];

  home.packages = with pkgs; [
    docker
    vscodium

    tcpdump
    filezilla

    # PHOTOGRAPHY
    rawtherapee
    ansel
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  # Update plugins
  # cd .config/home-manager && nix flake update && home-manager switch
}
