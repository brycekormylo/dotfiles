{
  programs.nixvim = {
    plugins = {
      nix.enable = true;
      ts-autotag.enable = true;
      hmts.enable = true;

      treesitter = {
        enable = true;
        nixvimInjections = true;
        folding = false;
        settings = {
          indent.enable = false;
          highlight.enable = true;
          ensureInstalled = [
            "tsx"
            "nix"
            "html"
            "markdown"
            "markdown_inline"
            "json"
            "css"
            "http"
            "javascript"
            "typescript"
            "lua"
            "regex"
            "rust"
            "java"
            "xml"
          ];
          autoInstall = true;
          sync_install = false;
        };
      };

      treesitter-refactor = {
        enable = true;
        highlightDefinitions = {
          enable = true;
          clearOnCursorMove = true;
        };
      };

      treesitter-context = {
        enable = true;
      };

      treesitter-textobjects = {
        enable = true;
        lspInterop.enable = true;
      };
    };
  };
}
