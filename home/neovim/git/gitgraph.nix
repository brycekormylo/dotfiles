{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "gitgraph";
        src = pkgs.fetchFromGitHub {
          owner = "isakbm";
          repo = "gitgraph.nvim";
          rev = "01e466b32c346a165135dd47d42f1244eca06572";
          hash = "sha256-d55IRrOhK5tSLo2boSuMhDbkerqij5AHgNDkwtGadyI=";
        };
      })
    ];
    extraConfigLua = ''
      require("gitgraph").setup({

      	opts = {
      		symbols = {
      			merge_commit = "M",
      			commit = "*",
      		},
      	},
      })
    '';
    keymaps = [
      {
        mode = ["n"];
        key = "<leader>gl";
        action = "<cmd>lua require('gitgraph').draw({}, { all = true, max_count = 5000 })<cr>";
      }
    ];
  };
}
