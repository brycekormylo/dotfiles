{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "screenkey";
        src = pkgs.fetchFromGitHub {
          owner = "NStefan002";
          repo = "screenkey.nvim";
          rev = "fea221f005662f43ebf72d9a23c3f75aa8fdf30b";
          hash = "sha256-aZ6wT72kjvRUwh7BUB7KZj7A0/E3WyHPNi0YAzDwKGU=";
        };
      })
    ];
    keymaps = [
      {
        key = "<leader><leader>s";
        action = "<cmd>Screenkey<cr>";
      }
    ];

    extraConfigLua = ''
      require("screenkey").setup({
      	win_opts = {
      		row = vim.o.lines - vim.o.cmdheight - 1,
      		col = vim.o.columns,
      		relative = "editor",
      		anchor = "SE",
      		width = 20,
      		height = 3,
      		border = "none",
      		title = "",
      		title_pos = "center",
      		style = "minimal",
      		focusable = false,
      		noautocmd = true,
      		zindex = 1,
      	},
      	compress_after = 3,
      	clear_after = 3,
      	disable = {
      		filetypes = {},
      		buftypes = {},
      		events = false,
      	},
      	show_leader = true,
      	group_mappings = false,
      	display_infront = {},
      	display_behind = {},
      	filter = function(keys)
      		return keys
      	end,
      	keys = {
      		["<TAB>"] = "󰌒",
      		["<CR>"] = "󰌑",
      		["<ESC>"] = "",
      		["<SPACE>"] = "␣",
      		["<BS>"] = "",
      		["<DEL>"] = "",
      		["<LEFT>"] = "",
      		["<RIGHT>"] = "",
      		["<UP>"] = "",
      		["<DOWN>"] = "",
      		["<HOME>"] = "",
      		["<END>"] = "󰨿",
      		["<PAGEUP>"] = "⥣",
      		["<PAGEDOWN>"] = "⥥",
      		["<INSERT>"] = "",
      		["<F1>"] = "󱊫",
      		["<F2>"] = "󱊬",
      		["<F3>"] = "󱊭",
      		["<F4>"] = "󱊮",
      		["<F5>"] = "󱊯",
      		["<F6>"] = "󱊰",
      		["<F7>"] = "󱊱",
      		["<F8>"] = "󱊲",
      		["<F9>"] = "󱊳",
      		["<F10>"] = "󱊴",
      		["<F11>"] = "󱊵",
      		["<F12>"] = "󱊶",
      		["CTRL"] = "",
      		["ALT"] = "",
      		["SUPER"] = "󰘳",
      		["<leader>"] = "⎵",
      	},
      })
    '';
  };
}
