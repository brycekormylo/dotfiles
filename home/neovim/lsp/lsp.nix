{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      # lsp-status.enable = true; needs config
      # typescript-tools.enable = true;
      rustaceanvim = {
        enable = true;
        settings.tools.enable_clippy = true;
      };

      lsp = {
        enable = true;
        servers = {
          nixd = {
            enable = true;
            cmd = ["nixd"];
            settings = {
              formatting.command = ["alejandra"];
              nixpkgs = {
                expr = "import <nixpkgs> { }";
              };
              options = {
                nixos.expr = ''
                  (builtins.getFlake "~/dot").nixosConfigurations.pathfinder.options
                '';
              };
            };
          };

          # emmet_ls.enable = true;
          # denols.enable = true;
          dockerls.enable = true;
          html.enable = true;
          jsonls.enable = true;
          tailwindcss.enable = true;
          ts_ls.enable = true;
          # cssls = {
          #   enable = true;
          #   settings = {
          #     css = {
          #       lint = {
          #         unknownAtRules = "ignore";
          #       };
          #     };
          #   };
          # };

          # sourcekit.enable = true; # Swift

          bashls.enable = true;
          clangd.enable = true;
          lua_ls.enable = true;
          yamlls.enable = true;
          kulala_ls = {
            enable = true;
            package = null;
          };

          marksman.enable = true;
          markdown_oxide.enable = true;
          typos_lsp = {
            enable = true;
            filetypes = ["markdown" "md"];
          };
        };
      };
    };

    extraPlugins = with pkgs.vimPlugins; [nvim-lspconfig];
    extraConfigLua = ''
      local nvim_lsp = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      capabilities.workspace = {
      	didChangeWatchedFiles = {
      		dynamicRegistration = true,
      	},
      }

      nvim_lsp.nixd.setup({
      	offset_encoding = "utf-8",
      })

      -- Allows use of deno without removing npm
      -- nvim_lsp.denols.setup({
      -- 	on_attach = on_attach,
      -- 	root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
      -- })

      -- nvim_lsp.ts_ls.setup({
      -- 	on_attach = on_attach,
      -- 	root_dir = nvim_lsp.util.root_pattern("package.json"),
      -- 	single_file_support = false,
      -- })

      local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
      local x = vim.diagnostic.severity

      vim.diagnostic.config({
        signs = {
          text = {
            [x.ERROR] = "󰅚 ",
            [x.WARN] = "󰀪 ",
            [x.HINT] = "󰌶 ",
            [x.INFO] = " "
          },
        },
      })

      -- for type, icon in pairs(signs) do
      -- 	local hl = "DiagnosticSign" .. type
      -- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      -- end
    '';
  };
}
