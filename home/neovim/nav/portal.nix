{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "portal";
        src = pkgs.fetchFromGitHub {
          owner = "cbochs";
          repo = "portal.nvim";
          rev = "77d9d53fec945bfa407d5fd7120f1b4f117450ed";
          hash = "sha256-QCdyJ5in3Dm4IVlBUtbGWRZxl87gKHhRiGmZcIGEHm0=";
        };
      })
    ];
    extraConfigLua = ''
      require("portal").setup({
      	opts = {
      		scope = "git",
      	},
      	event = { "BufReadPost", "BufNewFile" },
      })
    '';
    keymaps = [
      {
        key = "<leader>i";
        action = "<cmd>Portal jumplist forward<CR>";
      }
      {
        key = "<leader>o";
        action = "<cmd>Portal jumplist backward<CR>";
      }
      {
        key = "<leader>H";
        action = "<cmd>lua require('portal.builtin').harpoon.tunnel()<cr>";
      }
    ];
  };
}
