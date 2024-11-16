{
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  environment.systemPackages = with pkgs; [
    neovim
    disko
    parted
    git
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  programs.hyprland.enable = true;

  nixpkgs.hostPlatform = {system = "x86_64-linux";};

  # To build
  # nix build .#nixosConfigurations.iso.config.system.build.isoImage
}
