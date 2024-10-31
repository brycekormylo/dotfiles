{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "grapple";
        src = pkgs.fetchFromGitHub {
          owner = "cbochs";
          repo = "grapple.nvim";
          rev = "7aedc261b05a6c030397c4bc26416efbe746ebf1";
          hash = "sha256-apWKHEhXjFdS8xnSX0PoiOMzR+RVuYHFLV9sUl/HhTE=";
        };
      })
    ];
    extraConfigLua = ''
      require("grapple").setup({
      	opts = {
      		scope = "git",
      	},
      	event = { "BufReadPost", "BufNewFile" },
      })
    '';
    keymaps = [
      {
        key = "<leader>e";
        action = "<cmd>Grapple toggle_tags<CR>";
      }
      {
        key = "<leader>E";
        action = "<cmd>Grapple toggle<CR>";
      }
    ];
  };
}
