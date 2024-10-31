{
  description = "Home Manager configuration of bryce";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
    flake-utils.url = "github:numtide/flake-utils";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-compat.url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";
  };

  outputs = inputs @ {
    self,
    flake-parts,
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    # flake-parts.lib.mkFlake {inherit inputs;} {
    #   debug = true;
    #   systems = ["x86_64-linux"];
    #   perSystem = {config, ...}: {};

    # flake = {
    nixosConfigurations.pathfinder = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({pkgs, ...}: {
          networking.hostName = "hostname";
          # nixpkgs.overlays = [inputs.nixd.overlays.default];
          environment.systemPackages = with pkgs; [
            nixd
          ];
        })
      ];
    };
    homeConfigurations."bryce" = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = {
        inherit inputs;
      };
      modules = [
        ./home.nix
      ];
      # };
      # };
    };
  };
}
# {
#   description = "Home Manager configuration of bryce";
#
#   inputs = {
#     nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
#     home-manager = {
#       url = "github:nix-community/home-manager";
#       inputs.nixpkgs.follows = "nixpkgs";
#     };
#     ags.url = "github:Aylur/ags";
#     nixvim.url = "github:nix-community/nixvim";
#     nix-colors.url = "github:misterio77/nix-colors";
#     nixd.url = "github:nix-community/nixd";
#     firefox-addons = {
#       url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
#       inputs.nixpkgs.follows = "nixpkgs";
#     };
#     flake-utils.url = "github:numtide/flake-utils";
#     flake-parts.url = "github:hercules-ci/flake-parts";
#     flake-compat.url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";
#   };
#
#   outputs = inputs @ {
#     self,
#     flake-parts,
#     ...
#   }:
#     flake-parts.lib.mkFlake {inherit inputs;} rec {
#       debug = true;
#       systems = ["x86_64-linux" "i686-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin"];
#       perSystem = {
#         config,
#         self',
#         inputs',
#         pkgs,
#         system,
#         ...
#       }: {};
#
#       flake = let
#         lib = inputs.nixpkgs.lib;
#         sysKeys = builtins.listToAttrs (builtins.map (v: {
#             name = v;
#             value = null;
#           })
#           systems);
#         eachSys = f: (lib.attrsets.mapAttrs (k: v: f k) sysKeys);
#       in {
#         legacyPackages = eachSys (system: {
#           nixosConfigurations = import ./nixos/hosts {
#             hostname = inputs.nixpkgs.lib.nixosSystem {
#               system = "x86_64-linux";
#               modules = [
#                 ({pkgs, ...}: {
#                   networking.hostName = "hostname";
#                   nixpkgs.overlays = [inputs.nixd.overlays.default];
#                   environment.systemPackages = with pkgs; [
#                     nixd
#                   ];
#                 })
#               ];
#             };
#           };
#           homeConfigurations."bryce" = inputs.home-manager.lib.homeManagerConfiguration {
#             pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
#             extraSpecialArgs = {
#               inherit inputs;
#             };
#             modules = [
#               ./home.nix
#             ];
#           };
#         });
#       };
#       # For dev env
#       # devShells.x86_64-linux.default = pkgs.mkShell {};
#     };
# }

