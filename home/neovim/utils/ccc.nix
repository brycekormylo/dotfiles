{
  programs.nixvim = {
    plugins = {
      ccc.enable = true;
    };
    keymaps = [
      {
        key = "<leader><leader>c";
        action = "<cmd>:CccPick<cr>";
      }
    ];
  };
}
