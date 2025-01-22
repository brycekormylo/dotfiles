{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "smear-cursor";
        src = pkgs.fetchFromGitHub {
          owner = "sphamba";
          repo = "smear-cursor.nvim";
          rev = "791bd7871e612b17520cbde19ddede306d83ef11";
          hash = "sha256-Tr5LX3tTED1oh95SJjUX+n0J6XtKTt62R0UURPt6XuU=";
        };
      })
    ];

    extraConfigLua = ''
      require("smear_cursor").setup({
        opts = {                         -- Default  Range
          stiffness = 0.9,               -- 0.6      [0, 1]
          trailing_stiffness = 0.7,      -- 0.3      [0, 1]
          distance_stop_animating = 0.5, -- 0.1      > 0
          trailing_exponent = 2,
          legacy_computing_symbols_support = true,
          hide_target_hack = false,      -- true     boolean
        },
      })
    '';
  };
}
