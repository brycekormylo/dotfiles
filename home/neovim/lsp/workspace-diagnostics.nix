{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "workspace-diagnostics";
        src = pkgs.fetchFromGitHub {
          owner = "artemave";
          repo = "workspace-diagnostics.nvim";
          rev = "573ff93c47898967efdfbc6587a1a39e3c2d365e";
          hash = "sha256-lBj4KUPmmhtpffYky/HpaTwY++d/Q9socp/Ys+4VeX0=";
        };
      })
    ];
    extraConfigLua = ''
      require("workspace-diagnostics").setup({})
      require("lspconfig").ts_ls.setup({
      	on_attach = function(client, bufnr)
      		require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
      	end,
      })
    '';
    keymaps = [
      {
        mode = ["n"];
        key = "<leader><leader>W";
        action = ''
          function()
            for _, client in ipairs(vim.lsp.buf_get_clients()) do
              require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
            end
          end;
        '';
        options = {
          desc = "Workspace Diagnostics";
        };
      }
    ];
  };
}
