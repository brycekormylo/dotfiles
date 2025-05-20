{pkgs, ...}: let
  dependencies = with pkgs; [
    nodePackages.jsonlint
    # yamllint
    # hadolint
  ];
in {
  home.packages = dependencies;
  programs.nixvim = {
    plugins.lint = {
      enable = true;
      lintersByFt = {
        # nix = ["nix"];
        bash = ["bash"];
        rust = ["clippy"];
        json = ["jsonlint"];
        javascript = ["biomejs"];
        typescript = ["biomejs"];
        javascriptreact = ["biomejs"];
        typescriptreact = ["biomejs"];
        # yaml = ["yamllint"];
        # markdown = ["markdownlint"];
        # ruby = ["ruby"];
        # dockerfile = ["hadolint"];
      };
    };
    extraConfigLuaPost = ''
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      	callback = function()
      		require("lint").try_lint()
      	end,
      })
    '';
  };
}
