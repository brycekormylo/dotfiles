{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      aerial-nvim
    ];
    extraConfigLua = ''
      require("aerial").setup({})
    '';
    keymaps = [
      {
        mode = ["n"];
        key = "<leader>cw";
        action = "<cmd>AerialToggle!<cr>";
      }
    ];
  };
}
