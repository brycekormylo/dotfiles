{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "aerial";
        src = pkgs.fetchFromGitHub {
          owner = "stevearc";
          repo = "aerial.nvim";
          rev = "f6f74a04ba72f87c91a0f533d37e03c24518879a";
          hash = "sha256-wTBQKDCTdEtEL02+3ysEvgKcBK8bGccUUJXNaKlC1JA=";
        };
      })
    ];
    extraConfigLua = ''
      require("aerial").setup({})
    '';
    keymaps = [
      {
        mode = ["n"];
        key = "<leader>cw";
        action = "<cmd>AerialToggle!<cr>";
      }
    ];
  };
}
