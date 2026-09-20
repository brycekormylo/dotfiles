{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "relative-toggle";
        src = pkgs.fetchFromGitHub {
          owner = "cpea2506";
          repo = "relative-toggle.nvim";
          rev = "fabe2f60f5f148f2bf1fb76e8a542f5adf8d996a";
          hash = "sha256-eYBmlVpyP41Dt0qbRWTQPTCpsaIpGT73xHQmgzqD9pI=";
        };
      })
    ];
    extraConfigLua = ''
      require("relative-toggle").setup({
      	pattern = "*",
      	events = {
      		on = { "BufEnter", "FocusGained", "InsertLeave", "WinEnter", "CmdlineLeave" },
      		off = { "BufLeave", "FocusLost", "InsertEnter", "WinLeave", "CmdlineEnter" },
      	},
      })
    '';
  };
}
