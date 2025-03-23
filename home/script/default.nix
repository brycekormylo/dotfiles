{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./env_var.nix
  ];

  home.packages = [
    (import ./switch.nix {inherit pkgs;})
    (import ./imgbb.nix {inherit pkgs;})
  ];
}
