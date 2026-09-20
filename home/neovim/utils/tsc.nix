{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "tsc";
        src = pkgs.fetchFromGitHub {
          owner = "dmmulroy";
          repo = "tsc.nvim";
          rev = "82c37ebfe45d30763db6f45b54e18f1e485bb52c";
          hash = "sha256-mpJWipLdqxoMe0ixMnhgZguKQK+1iCqH5/v2NQ4vypE=";
        };
      })
    ];
    extraConfigLua = ''
      require("tsc").setup({})
    '';
    keymaps = [
      {
        key = "<leader><leader>t";
        action = "<cmd>:TSC<cr>";
      }
    ];
  };
}
