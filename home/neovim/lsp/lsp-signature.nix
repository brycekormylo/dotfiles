{
  programs.nixvim = {
    plugins = {
      lsp-signature = {
        enable = true;
        settings = {
          hint_enable = true;
          hint_inline = "eol";
          hint_prefix = "🐼 ";
        };
      };
    };
  };
}
