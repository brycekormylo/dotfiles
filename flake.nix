{
  description = "Pathfinder NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags.url = "github:Aylur/ags/v1";
    nixvim.url = "github:nix-community/nixvim";
    nix-colors.url = "github:misterio77/nix-colors";
    nixd.url = "github:nix-community/nixd";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    nixd,
    home-manager,
    nixos-hardware,
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
          nixos-hardware.nixosModules.dell-precision-7520
          {
            nixpkgs.overlays = [
              nixd.overlays.default
              (self: super: {linuxPackages = super.linuxPackages_6_1;})
            ];
          }
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
      iso = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./iso/configuration.nix
        ];
      };
    };
  };
}
