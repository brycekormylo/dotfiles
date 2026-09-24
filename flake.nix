{
  description = "Pathfinder NixOS";

  inputs = {
    nixpkgs.url = "git+https://github.com/NixOS/nixpkgs?shallow=1&ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixCats.url = "github:BirdeeHub/nixCats-nvim";
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixd.url = "github:nix-community/nixd";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    home-manager,
    nixpkgs,
    stylix,
    ...
  }: let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      pathfinder = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        inherit system;

        modules = [
          ./configuration.nix

          stylix.nixosModules.stylix

          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # If home manager doesnt exist run: nix shell nixpkgs#home-manager

            home-manager.backupFileExtension = "backup";
            home-manager.users.bryce = import ./home/home.nix;
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };
          }
        ];
      };
    };
  };
}
