{
  programs.nixvim = {
    plugins.undotree = {
      enable = true;
      settings = {
        autoOpenDiff = true;
        focusOnToggle = true;
      };
    };
    keymaps = [
      {
        key = "<leader>z";
        action = "<cmd>:UndotreeToggle<cr>";
      }

      {
        key = "<leader>z";
        action = "<cmd>:UndotreeFocus<cr>";
      }
    ];
  };
}
