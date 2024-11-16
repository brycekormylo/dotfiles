{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags.url = "github:Aylur/ags";
    nixvim.url = "github:nix-community/nixvim";
    nix-colors.url = "github:misterio77/nix-colors";
    nixd.url = "github:nix-community/nixd";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # flake-utils.url = "github:numtide/flake-utils";
    # flake-parts.url = "github:hercules-ci/flake-parts";
    # flake-compat.url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";
  };

  outputs = inputs @ {
    nixpkgs,
    nixd,
    home-manager,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    nixosConfigurations = {
      pathfinder = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        inherit system;
        modules = [
          ./configuration.nix
          {
            nixpkgs.overlays = [nixd.overlays.default];
          }
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # If home manager doesnt exist
            # nix shell nixpkgs#home-manager

            home-manager.backupFileExtension = "backup";
            home-manager.users.bryce = import ./home/home.nix;
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };
          }
        ];
      };
      iso = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./iso/configuration.nix
        ];
      };
    };
  };
}
