{
  programs.nixvim = {
    plugins.nvim-ufo = {
      enable = true;
    };
    opts = {
      foldcolumn = "0";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;
    };
    keymaps = [
      {
        key = "zm";
        action = "<cmd>lua require('ufo').openAllFolds<cr>";
      }
      {
        key = "zr";
        action = "<cmd>lua require('ufo').closeAllFolds<cr>";
      }
    ];
    extraConfigLua = ''
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
      	dynamicRegistration = false,
      	lineFoldingOnly = true,
      }
      local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
      for _, ls in ipairs(language_servers) do
      	require("lspconfig")[ls].setup({
      		capabilities = capabilities,
      		-- you can add other fields for setting up lsp server in this table
      	})
      end
      require("ufo").setup()
    '';
  };
}
