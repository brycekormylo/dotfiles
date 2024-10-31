{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "pomo";
        src = pkgs.fetchFromGitHub {
          owner = "epwalsh";
          repo = "pomo.nvim";
          rev = "aa8decc421d89be0f10b1fc6a602cdd269f350ff";
          hash = "sha256-tJ2TrypKnCnQm+6FDjX0KDr+UNoBBVvGIm+uWJtpNLc=";
        };
      })
    ];
    extraConfigLua = ''
      require("pomo").setup({})
    '';
  };
}
