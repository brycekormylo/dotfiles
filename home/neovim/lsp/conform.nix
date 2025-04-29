{pkgs, ...}: let
  dependencies = with pkgs; [
    alejandra
    biome
    kulala-fmt
    leptosfmt
    rustywind
    stylua
    superhtml
    yamlfix
    # google-java-format
  ];
in {
  home.packages = dependencies;

  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    settings = {
      format_after_save = {
        lsp_fallback = true;
        timeout_ms = 2000;
      };
      notify_on_error = true;
      formatters_by_ft = {
        nix = ["alejandra" "stylua"];
        lua = ["stylua"];

        # java = ["google-java-format"];

        javascript = ["biome" "rustywind"];
        typescript = ["biome" "rustywind"];
        javascriptreact = ["biome" "rustywind"];
        typescriptreact = ["biome" "rustywind"];
        html = ["superhtml"];
        css = ["biome"];
        json = ["biome"];

        yaml = ["yamlfix"];
        # markdown = ["mdsf"]; # mdformat inserts / before every bracket
        rust = ["rustfmt" "leptosfmt"];

        http = ["kulala-fmt"];

        # "*" = ["injected"];
      };
      formatters = {
        kulala = {
          command = "kulala-fmt";
          args = ["$FILENAME"];
          stdin = false;
        };
      };
    };
  };
}
