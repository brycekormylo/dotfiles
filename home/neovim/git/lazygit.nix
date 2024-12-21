{pkgs, ...}: {
  programs.nixvim = {
    plugins.lazygit = {
      enable = true;
    };
    keymaps = [
      {
        key = "<leader><leader>n";
        action = "<cmd>:LazyGit<CR>";
      }
    ];
  };
}
