{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "modes";
        src = pkgs.fetchFromGitHub {
          owner = "mvllow";
          repo = "modes.nvim";
          rev = "1e34663c32e8f5d915921a938e0dc4e3e788ceb8";
          hash = "sha256-XgER+qp/GSAimj7C23coOpwsEc3CdImyN+tFVIPKqh0=";
        };
      })
    ];
    extraConfigLuaPost = ''      --lua
         local palette = require("palette.theme")

         require('modes').setup({
         	colors = {
         		bg = "", -- Optional bg param, defaults to Normal hl group
         		copy = palette.main.base09,
         		delete = palette.accent.accent0,
         		insert = palette.accent.accent4,
         		visual = palette.accent.accent2,
         	},

         	-- Set opacity for cursorline and number background
         	line_opacity = 0.05,

         	-- Enable cursor highlights
         	set_cursor = false,

         	-- Enable cursorline initially, and disable cursorline for inactive windows
         	-- or ignored filetypes
         	set_cursorline = true,

         	-- Enable line number highlights to match cursorline
         	set_number = true,

         	-- Disable modes highlights in specified filetypes
         	-- Please PR commonly ignored filetypes
         	ignore_filetypes = { 'NvimTree', 'TelescopePrompt' }
         })
    '';
  };
}
