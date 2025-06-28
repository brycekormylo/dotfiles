{pkgs, ...}: {
  home.packages = with pkgs; [
    # Web
    bun
    deno
    nodejs_22
    # mono

    # Lang
    go
    nixd
    python3
    rustup
    zig
    gradle
    zulu

    # Tags
    # cscope
    # global
    # universal-ctags

    # Utils
    # cargo-generate
    mercurial
    manix
    markdown-oxide
    npm-check
    rustlings
    semgrep
    tokei
    # wasm-pack
    # wasm-tools
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
