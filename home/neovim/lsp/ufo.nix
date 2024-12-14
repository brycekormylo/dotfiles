{
  programs.nixvim = {
    plugins.nvim-ufo = {
      enable = true;
    };
    opts = {
      foldcolumn = "0";
      foldlevel = 10;
      foldlevelstart = 99;
      foldenable = true;
    };
    extraConfigLua = ''
      require("ufo").setup({
          provider_selector = function(bufnr, filetype, buftype)
              return {"treesitter", "indent"}
          end
      })
      vim.keymap.set('n', 'zr', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zm', require('ufo').closeAllFolds)
    '';
  };
}
