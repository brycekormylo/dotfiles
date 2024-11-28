{
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

        java = ["google-java-format"];

        javascript = ["prettierd" "rustywind"];
        typescript = ["prettierd" "rustywind"];
        javascriptreact = ["prettierd" "rustywind"];
        typescriptreact = ["prettierd" "rustywind"];
        html = [["prettierd" "prettier"]];
        css = [["prettierd" "prettier"]];
        json = [["prettierd" "prettier"]];

        yaml = ["yamlfix"];
        markdown = ["injected"]; # mdformat inserts / before every bracket
        rust = ["rustfmt"];

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
