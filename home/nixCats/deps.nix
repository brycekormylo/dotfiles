{pkgs, ...}: {
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
