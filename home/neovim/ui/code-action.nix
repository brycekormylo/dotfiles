{pkgs, ...}: {
  home.packages = with pkgs; [
    delta
    difftastic
  ];
  programs.nixvim = {
    keymaps = [
      {
        mode = ["n" "v"];
        key = "<leader>ca";
        action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
        options = {
          desc = "Code Actions";
        };
      }
    ];
  };
}
