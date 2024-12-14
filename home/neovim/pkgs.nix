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
    wasm-pack
    cargo-generate
    wasm-tools
    yamlfix
    yamlfmt
    yamllint
    zig
    markdown-oxide
  ];
}
