{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    (import ./script.nix {inherit pkgs;})
  ];
}
