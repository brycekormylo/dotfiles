{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "modicator";
        src = pkgs.fetchFromGitHub {
          owner = "mawkler";
          repo = "modicator.nvim";
          rev = "d1d327fd4bdfc3af4cfdf83b85c2eaefa71de7a8";
          hash = "sha256-XhAMRME5zfAKhe9z2LTq+DIM9gS5Fr4xYB82A9fyOfA=";
        };
      })
    ];
    extraConfigLuaPost = ''        --lua
      require("modicator").setup({
        show_warnings = false;
        highlights = {
          use_cursorline_background = true,
        },
      })
    '';
  };
}
