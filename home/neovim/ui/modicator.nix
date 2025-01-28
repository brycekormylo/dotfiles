{pkgs, ...}: {
  programs.nixvim = {
    # extraPlugins = [
    #   (pkgs.vimUtils.buildVimPlugin {
    #     name = "modicator";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "mawkler";
    #       repo = "modicator.nvim";
    #       rev = "45b64561e109cd04de551b081fb947b4f856009e";
    #       hash = "sha256-WqygTdpNlABHdplKbsJAEpQI71OURHMT8OErPNKPD9w=";
    #     };
    #   })
    # ];
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
            enabled = false,
            mode_section = nil,
            highlight = 'bg',
          },
        },
      })
    '';
  };
}
