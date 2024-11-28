{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "inc-rename";
        src = pkgs.fetchFromGitHub {
          owner = "smjonas";
          repo = "inc-rename.nvim";
          rev = "8ba77017ca468f3029bf88ef409c2d20476ea66b";
          hash = "sha256-qbiBvmVCJrqNKmSzRaCHZXpr87YSj9zJ6/AFRLK+Kgc=";
        };
      })
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
