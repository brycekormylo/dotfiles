{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      grapple-nvim
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
