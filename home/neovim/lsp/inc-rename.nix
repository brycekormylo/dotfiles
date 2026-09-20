{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      inc-rename-nvim
    ];
    extraConfigLua = ''
      require("inc_rename").setup({
      	input_buffer_type = "dressing",
      })
      vim.keymap.set("n", "<leader>cr", ":IncRename ")
    '';
    # keymaps = [
    #   {
    #     mode = ["n"];
    #     key = "<leader>cr";
    #     action = ":IncRename ";
    #     options = {
    #       desc = "Rename";
    #     };
    #   }
    # ];
  };
}
