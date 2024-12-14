{pkgs, ...}: {
  programs.nixvim = {
    plugins.neogit = {
      enable = true;
    };
    keymaps = [
      {
        key = "<leader><leader>n";
        action = "<cmd>:Neogit<CR>";
      }
    ];
  };
}
