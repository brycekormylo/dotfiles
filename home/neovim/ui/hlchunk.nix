{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "hlchunk";
        src = pkgs.fetchFromGitHub {
          owner = "shellRaining";
          repo = "hlchunk.nvim";
          rev = "ba6e2347177fec8ec6af4ae26d11a468c9e0ca72";
          hash = "sha256-Rx5kpjfpiH9i/IvOXx+wEWSO4gdfmXdhULDxbcBJQAY=";
        };
      })
    ];

    extraConfigLua = ''
      require("hlchunk").setup({
      	chunk = {
      		enable = true,
      		duration = 0,
      		delay = 0,
      		style = {
      			{ fg = "#665c54" },
      			{ fg = "#ebdbb2" },
      		},
      		chars = {
      			horizontal_line = "─",
      			vertical_line = "│",
      			left_top = "╭",
      			left_bottom = "╰",
      			right_arrow = "─",
      		},
      	},
      	indent = {
      		enable = true,
      		chars = {
      			"│",
      		},
      		style = {
      			{ fg = "#3c3836" },
      		},
      		ahead_lines = 2,
      		delay = 0,
      		filter_list = {
      			function(v)
      				return v.level ~= 1
      			end,
      		},
      	},
      })
    '';
  };
}
