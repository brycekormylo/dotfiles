{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "icon-picker";
        src = pkgs.fetchFromGitHub {
          owner = "ziontee113";
          repo = "icon-picker.nvim";
          rev = "3ee9a0ea9feeef08ae35e40c8be6a2fa2c20f2d3";
          hash = "sha256-VZKsVeSmPR3AA8267Mtd5sSTZl2CAqnbgqceCptgp4w=";
        };
      })
    ];
    extraConfigLua = ''
      require("icon-picker").setup({ disable_legacy_commands = true })

      local opts = { noremap = true, silent = true }

      vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
      vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
      vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
    '';
  };
}
