{pkgs, ...}: {
  home.packages = with pkgs; [
    luajitPackages.fzy
  ];
  programs.nixvim = {
    plugins.wilder = {
      enable = true;
      modes = ["/" "?" ":"];
    };
    extraPlugins = with pkgs.vimPlugins; [
      # fzy-lua-native
    ];
    extraConfigLua = ''
      local wilder = require("wilder")

      wilder.set_option(
      	"renderer",
      	wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
      		border = "rounded",
      		max_height = "30%", -- max height of the palette
      		min_height = 0, -- set to the same as 'max_height' for a fixed height window
      		max_width = "40%",
      		min_width = "40%",
      		prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
      		reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
      		highlighter = wilder.basic_highlighter(),
      		left = { " ", wilder.popupmenu_devicons() },
      	}))
      )
    '';
  };
}
