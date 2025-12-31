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
    # ./neovim
    ./nixCats
    ./script
    ./terminal
    ./utils

    ./colorscheme.nix
  ];

  home.packages = with pkgs; [
    docker

    # PHOTOGRAPHY
    darktable
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  # Needs to be declared separately here for home-manger
  nix.gc = {
    automatic = true;
    frequency = "weekly";
    options = "--delete-older-than 30d";
  };
}
