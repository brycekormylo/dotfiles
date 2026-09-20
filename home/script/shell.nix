{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell
{
  nativeBuildInputs = with pkgs; [
    nodejs
  ];

  packages = with pkgs; [
    nodejs
    python3
  ];

  inputsFrom = with pkgs; [
    bat
  ];
  shellHook = ''
    echo "welcome"
  '';

  # Any random identifiers are interpreted as global variables
  COLOR = "blue";
  PASSWORD = import ./password.nix;
}
