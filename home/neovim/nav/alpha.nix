{
  programs.nixvim = {
    plugins.alpha = {
      enable = true;
      theme = "dashboard";
      # iconsEnabled = true;
    };
    keymaps = [
      {
        key = "<leader>A";
        action = "<cmd>:Alpha<cr>";
      }
    ];
  };
}
