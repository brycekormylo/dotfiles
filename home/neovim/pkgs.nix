{pkgs, ...}: {
  home.packages = with pkgs; [
    # Fmt
    alejandra
    biome
    google-java-format
    hadolint
    kulala-fmt
    markdownlint-cli
    mdformat
    nodePackages.jsonlint
    rustywind
    statix
    stylua
    yamlfmt
    yamllint

    # Web
    superhtml
    bun
    deno
    nodejs_22
    mono

    # Lang
    go
    gradle
    nixd
    python3
    rustup
    zig
    zulu

    # Tags
    cscope
    global
    universal-ctags

    # Utils
    cargo-generate
    manix
    markdown-oxide
    npm-check
    rustlings
    semgrep
    tokei
    wasm-pack
    wasm-tools
    yamlfix
    # cargo
    # cargo-leptos
    # clippy
    # leptosfmt
    # rustfmt
    # swift
    # trunk
  ];
}
