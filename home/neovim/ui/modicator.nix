{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      modicator-nvim
    ];
    extraConfigLua = ''        --lua
      require("modicator").setup({
        show_warnings = false,
        highlights = {
          use_cursorline_background = true,
        },
        integration = {
          lualine = {
            enabled = true,
            mode_section = nil,
            highlight = 'bg',
          },
        },
      })
    '';
  };
}
