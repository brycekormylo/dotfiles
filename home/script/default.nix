{pkgs, ...}: {
  imports = [
    ./env_var.nix
  ];

  home.packages = [
    (import ./switch.nix {inherit pkgs;})
    (import ./imgbb.nix {inherit pkgs;})
    (import ./dev.nix {inherit pkgs;})
    (import ./ivpn_on.nix {inherit pkgs;})
    (import ./ivpn_off.nix {inherit pkgs;})
    (import ./waybar_on.nix {inherit pkgs;})
    (import ./waybar_off.nix {inherit pkgs;})
  ];
}
