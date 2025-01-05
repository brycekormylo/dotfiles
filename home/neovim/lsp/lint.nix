{pkgs, ...}: {
  programs.nixvim = {
    plugins.lint = {
      enable = true;
      lintersByFt = {
        # nix = ["nix"];
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
