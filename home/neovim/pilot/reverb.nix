{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "reverb";
        src = pkgs.fetchFromGitHub {
          owner = "whleucka";
          repo = "reverb.nvim";
          rev = "9bd6e7c7a5e1f4cee28ec48e105528acefa7735f";
          hash = "sha256-tJQe0HoYafFAqlQiJyoXbvlfpuPxR/U049g/jwwNPZg=";
        };
      })
    ];
    extraConfigLua = ''
      require("reverb").setup({
      	opts = {
      		BufWrite = { path = "~/.vim/sounds/ttf2_kill.mp3", volume = 50 },
      		-- QuitPre = { path = "~/.vim/sounds/kraber.mp3", volume = 100 },
      		-- CursorMoved = { path = "~/.vim/sounds/alternator.mp3", volume = 100 },
      		-- InsertCharPre = { path = "~/.vim/sounds/alternator.mp3", volume = 100 },
      		-- CmdlineEnter = { path = "~/.vim/sounds/kraber.mp3", volume = 100 },
      		-- CmdlineLeave = { path = "~/.vim/sounds/kraber.mp3", volume = 100 },
      	},
      })
    '';
  };
}
