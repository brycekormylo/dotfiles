{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "nvim-early-retirement";
        src = pkgs.fetchFromGitHub {
          owner = "chrisgrieser";
          repo = "nvim-early-retirement";
          rev = "2c36a5671b9d8f0d9e11b77c5a55de802bc45e34";
          hash = "sha256-+W3AG99nzgr36t9Sg192hb/MH8s0uGAPD0cLBnil+og=";
        };
      })
    ];
    extraConfigLua = ''
      require("early-retirement").setup({
      	defaultOps = {
      		minimumBufferNum = 3,
      	},
      })
    '';
  };
}
