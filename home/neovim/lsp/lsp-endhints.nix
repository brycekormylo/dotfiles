{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "lsp-endhints";
        src = pkgs.fetchFromGitHub {
          owner = "chrisgreiser";
          repo = "nvim-lsp-endhints";
          rev = "a449f2f27b6b985ff216964572224ce432d94a86";
          hash = "sha256-kw7tX/bkzm68WcB/VB1tcRNiNKjEYsVboiUzowagId4=";
        };
      })
    ];
    extraConfigLua = ''
      require("lsp-endhints").setup({
      	icons = {
      		type = "󰔷 ",
      		parameter = "󰇙",
      		offspec = " ", -- hint kind not defined in official LSP spec
      		unknown = "⊣ ", -- hint kind is nil
      	},
      	label = {
            truncateAtChars = 40,
      		padding = 1,
      		marginLeft = 0,
      		bracketedParameters = false,
      	},
      	autoEnableHints = true,
      })

      -- lua-ls
      require("lspconfig").lua_ls.setup {
          settings = {
              Lua = {
                  hint = { enable = true },
              },
          },
      }

      -- tsserver
      local inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
      }
      require("lspconfig").ts_ls.setup {
          settings = {
              typescript = {
                  inlayHints = inlayHints,
              },
              javascript = {
                  inlayHints = inlayHints,
              },
          },
      }
    '';
    keymaps = [
      {
        mode = ["n"];
        key = "<leader>ce";
        action = "<cmd>lua require('lsp-endhints').toggle()<cr>";
        options = {
          desc = "Toggle Endhints";
        };
      }
    ];
  };
}
