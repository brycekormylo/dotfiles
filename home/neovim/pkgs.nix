{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    superhtml
    bun
    biome
    universal-ctags
    cscope
    global
    curl
    deno
    go
    google-java-format
    gradle
    hadolint
    kulala-fmt
    manix
    markdownlint-cli
    mdformat
    mono
    nixd
    nodePackages.jsonlint
    nodejs_22
    npm-check
    python3
    rustlings
    # rustfmt
    # clippy
    # trunk
    # leptosfmt
    # cargo-leptos
    rustup
    # cargo
    rustywind
    semgrep
    statix
    stylua
    tokei
    # swift
    wasm-pack
    cargo-generate
    wasm-tools
    yamlfix
    yamlfmt
    yamllint
    zig
    markdown-oxide
    zulu
  ];
}
