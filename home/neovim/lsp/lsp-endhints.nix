{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "lsp-endhints";
        src = pkgs.fetchFromGitHub {
          owner = "chrisgreiser";
          repo = "nvim-lsp-endhints";
          rev = "391ef40521b631a8a2fb7aef78db6967ead6b39d";
          hash = "sha256-dCySjZoCxcCkt8D1UVJF9wQheU8vgmDxkI0JeGURpnQ=";
        };
      })
    ];
    extraConfigLua = ''
      require("lsp-endhints").setup({
      	icons = {
      		type = "▢ ",
      		parameter = "󰏪 ",
      		offspec = " ", -- hint kind not defined in official LSP spec
      		unknown = "⊣ ", -- hint kind is nil
      	},
      	label = {
      		padding = 1,
      		marginLeft = 0,
      		bracketedParameters = true,
      	},
      	autoEnableHints = true,
      })
    '';
    keymaps = [
      {
        mode = ["n"];
        key = "<leader>cr";
        action = "<cmd>lua require('lsp-endhints').enable()<cr>";
        options = {
          desc = "Rename";
        };
      }
    ];
  };
}
