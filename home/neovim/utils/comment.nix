{
  programs.nixvim = {
    plugins.comment = {
      enable = true;
      settings = {
        opleader.line = "<leader>x";
        toggler.line = "<leader>x";
      };
    };
  };
}
