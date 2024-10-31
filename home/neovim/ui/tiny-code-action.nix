{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "tiny-code-action";
        src = pkgs.fetchFromGitHub {
          owner = "rachartier";
          repo = "tiny-code-action.nvim";
          rev = "1cfb7c19a8010f10c2d77fb7f1e484174b6124d4";
          hash = "sha256-nGMCTG61LLBkRuEjBKrvwL9cEUphRh+9m/2a5ODxN4g=";
        };
      })
    ];
    extraConfigLua = ''
      require("tiny-code-action").setup({})
    '';
    keymaps = [
      {
        mode = ["n" "v"];
        key = "<leader>ca";
        action = "<cmd>lua require('tiny-code-action').code_action()<cr>";
        options = {
          desc = "Code Actions";
        };
      }
    ];
  };
}
