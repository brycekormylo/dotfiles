{pkgs, ...}: {
  programs.nixvim = {
    plugins.diffview = {
      enable = true;
    };
    keymaps = [
      {
        key = "<leader><leader>d";
        action = "<cmd>:DiffviewOpen<CR>";
      }
      {
        key = "<leader><leader>D";
        action = "<cmd>:DiffviewClose<CR>";
      }
    ];
  };
  home.packages = with pkgs; [
    mercurial
  ];
}
