{pkgs, ...}: {
  programs.nixvim = {
    plugins.lint = {
      enable = true;
      lintersByFt = {
        # nix = ["nix"];
        # text = ["vale"];
        json = ["jsonlint"];
        javascript = ["eslint_d"];
        typescript = ["eslint_d"];
        javascriptreact = ["eslint_d"];
        typescriptreact = ["eslint_d"];
        # yaml = ["yamllint"];
        # markdown = ["markdownlint"];
        # ruby = ["ruby"];
        # dockerfile = ["hadolint"];
      };
    };
    extraConfigLua = ''
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      	callback = function()
      		require("lint").try_lint()
      	end,
      })
    '';
  };
}
