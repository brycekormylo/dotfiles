{
  pkgs,
  inputs,
  ...
}: {
  # nixpkgs = {
  #   overlays = [
  #     inputs.neovim-nightly-overlay.overlays
  #   ];
  # };
  # programs.neovim = {
  #   enable = true;
  #   package = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;
  # };
  home.packages = with pkgs; [
    # bun
    # deno
    nodejs_22
    # rustup
    cargo
    # alsa-lib.dev

    mercurial
    manix
    npm-check
    rustlings
    semgrep
    tokei
  ];
}
