{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "satellite";
        src = pkgs.fetchFromGitHub {
          owner = "lewis6991";
          repo = "satellite.nvim";
          rev = "777ed56e1ef45ec808df701730b6597fc4fb0fbc";
          hash = "sha256-04Js+9SB4VuCq/ACbNh5BZcolu8i8vlGU72qo5xxfpk=";
        };
      })
    ];
    extraConfigLua = ''
      require("satellite").setup({
      	width = 1,
      })
    '';
  };
}
