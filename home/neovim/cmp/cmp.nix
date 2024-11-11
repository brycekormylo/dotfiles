{
  programs.nixvim = {
    plugins = {
      cmp = {
        enable = true;
        autoEnableSources = false;
        settings = {
          snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          formatting = {
            fields = ["abbr" "kind" "menu"];
          };
          experimental = {
            native_menu = false;
            ghost_text = false;
          };
          matching = {
            disallow_fuzzy_matching = true;
            disallow_fullfuzzy_matching = true;
            disallow_partial_fuzzy_matching = true;
            disallow_prefix_unmatching = true;
          };
          performance = {
            debounce = 10;
            fetchingTimeout = 10000;
            maxViewEntries = 7;
            throttle = 10;
          };

          window = {
            completion = {
              border = [
                ""
                ""
                ""
                ""
                ""
                ""
                ""
                ""
              ];
            };
            documentation = {
              border = [
                "╭"
                "─"
                "╮"
                "│"
                "╯"
                "─"
                "╰"
                "│"
              ];
            };
          };

          mapping = {
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };

          sources = [
            {
              name = "nvim_lsp";
              max_item_count = 10;
              keywordLength = 2;
              # option = {
              #   markdown_oxide = {
              #     keyword_pattern = "[[\(\k\| \|\/\|#\)\+]]";
              #   };
              # };
            }
            {
              name = "treesitter";
              keywordLength = 1;
            }
            # {
            #   name = "nvim_lsp_signature_help";
            # }
            # {name = "mkdnflow";}
            {
              name = "luasnip";
              max_item_count = 5;
              # keywordLength = 2;
            }
            # {
            #   name = "buffer";
            #   # Words from other open buffers can also be suggested.
            #   # option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            #   indexing_internal = 1000;
            #   max_item_count = 5;
            #   keywordLength = 3;
            # }
            # {name = "cmp_tabby";}
            {
              name = "path";
              keywordLength = 1;
            }
            # {
            #   name = "nvim_lua";
            #   keywordLength = 2;
            # }
          ];

          sorting = {
            comparators = [
              "require('cmp.config.compare').recently_used"
              "require('cmp.config.compare').exact"
              "require('cmp.config.compare').offset"
              "require('cmp.config.compare').score"
              "require('cmp.config.compare').kind"
              "require('cmp.config.compare').locality"
              "require('cmp.config.compare').length"
              "require('cmp.config.compare').order"
            ];
          };
        };
      };
      cmp-nvim-lsp.enable = true;
      # cmp-nvim-lsp-signature-help.enable = true;
      # cmp-nvim-lua.enable = true;
      cmp-treesitter.enable = true;
      # cmp-tabby.enable = true;
      # cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp_luasnip.enable = true;
      # cmp-cmdline.enable = true;
    };
    extraConfigLua = ''
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      capabilities.workspace = {
      	didChangeWatchedFiles = {
      		dynamicRegistration = true,
      	},
      }
    '';
  };
}
