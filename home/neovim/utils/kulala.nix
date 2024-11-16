{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "kulala";
        src = pkgs.fetchFromGitHub {
          owner = "mistweaverco";
          repo = "kulala.nvim";
          rev = "eb03136797d5374b0142b8f7e4438334387fa183";
          hash = "sha256-h6MsNAmpRrRRGMHVzwGWhj4iHobcgsKnc80n26FQ+pk=";
        };
      })
    ];
    keymaps = [
      {
        key = "<leader><leader>k";
        action = "<cmd>lua require('kulala').run()<cr>";
        options = {
          desc = "Kulala Run";
        };
      }
    ];
    extraConfigLua = ''
      vim.filetype.add({
      	extension = {
      		["http"] = "http",
      	},
      })
      require("kulala").setup({
      	-- opts = {
      	-- 	display_mode = "float",
      	-- 	icons = {
      	-- 		inlay = {
      	-- 			loading = "⏳",
      	-- 			done = "✅",
      	-- 			error = "❌",
      	-- 		},
      	-- 		lualine = "🐼",
      	-- 	},
      	-- },
      })
    '';
  };
}
