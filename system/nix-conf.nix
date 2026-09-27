{
  inputs,
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    deadnix
    nix-diff
    nix-output-monitor
    nix-prefetch-github
    nix-tree
    nvd
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root" "@wheel"];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 8d";
    };
    optimise.automatic = true;
    nixPath = [
      "nixpkgs=${inputs.nixpkgs}"
      "nixos-config=${config.users.users.bryce.home}/dot/configuration.nix"
    ];
  };
}
