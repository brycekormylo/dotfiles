{pkgs, ...}: {
  home.packages = with pkgs; [
    # Nix package dependencies for nvim plugins
    alejandra
    bun
    ctags
    curl
    deno
    eslint_d
    go_1_22
    google-java-format
    hadolint
    kulala-fmt
    manix
    markdownlint-cli
    mdformat
    mono
    nixd
    nodePackages.jsonlint
    nodePackages.prettier
    nodejs_22
    npm-check
    prettierd
    python3
    rustlings
    # rust-analyzer
    rustfmt
    clippy
    # rustup
    cargo
    rustywind
    semgrep
    statix
    stylua
    tokei
    vale
    wasm-pack
    cargo-generate
    wasm-tools
    yamlfix
    yamlfmt
    yamllint
    zig
    # markdown-oxide
  ];
}
