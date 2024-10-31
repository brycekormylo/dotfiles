{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "boo";
        src = pkgs.fetchFromGitHub {
          owner = "LukasPietzschmann";
          repo = "boo.nvim";
          rev = "926b2e92c7e4341ef5e64c7c8f3373768f5e9437";
          hash = "sha256-zEbPDCXLcQCDRTf8sfbm07tyqAkJtvtHy43wF5Feee0=";
        };
      })
    ];
    extraConfigLua = ''
      require("boo").setup({
      	{
      		-- win_opts will be used when creating the window. You can put everything here,
      		-- that vim.api.nvim_open_win (https://neovim.io/doc/user/api.html#nvim_open_win())
      		-- can handle.
      		win_opts = {
      			title = " LSP Info ",
      			title_pos = "center",
      			relative = "cursor",
      			row = 1,
      			col = 0,
      			style = "minimal",
      			border = "rounded",
      			focusable = true,
      		},
      		-- The window will not be wider than max_width (in character cells)
      		max_width = 80,
      		-- The window will not be taller than max_height (in character cells)
      		max_height = 20,
      		-- When the boo window is focused, pressing one of these will close it.
      		-- They will only be mapped in normalmode
      		escape_mappings = { "q", "<esc>" },
      		-- Focus boo's window automatically after it's created
      		focus_on_open = true,
      		-- When the boo window is focused, and you'll focus another buffer,
      		-- the window will be closed when this is set to true
      		close_on_leave = true,
      		-- When moving the cursor in the buffer that boo was opened from, boo
      		-- will be closed. This makes most sense when paired with
      		-- `focus_on_open = false`
      		close_on_mouse_move = true,
      	},
      })
    '';
    keymaps = [
      {
        mode = ["n"];
        key = "<leader>k";
        action = "<cmd>lua require('boo').boo()<cr>";
        options = {
          desc = "Peek docs";
        };
      }
      {
        mode = ["n"];
        key = "<C-c>";
        action = "<cmd>lua require('boo').close()<cr>";
        options = {
          desc = "Hide docs";
        };
      }
    ];
  };
}
