{
  programs.nixvim = {
    plugins = {
      fzf-lua = {
        enable = true;

        settings = {
          winopts = {
            backdrop = 90;
          };
        };

        keymaps = {
          "<leader>fa" = {
            action = "files";
            options = {
              desc = "Fzf files";
            };
          };

          "<leader>fz" = {
            action = "live_grep";
            options = {
              desc = "Fzf grep";
            };
          };

          "<leader>ff" = {
            action = "resume";
            options = {
              desc = "Fzf resume";
            };
          };

          "<leader>fe" = {
            action = "diagnostics_workspace";
            options = {
              desc = "Fzf diagnostics";
            };
          };

          "<leader>fs" = {
            action = "lsp_workspace_symbols";
            options = {
              desc = "Fzf lsp_workspace_symbols";
            };
          };

          "<leader>fk" = {
            action = "keymaps";
            options = {
              desc = "Fzf keymaps";
            };
          };

          "<leader>fx" = {
            action = "lsp_code_actions";
            options = {
              desc = "Fzf lsp_code_actions";
            };
          };

          "<leader>fl" = {
            action = "lsp_finder";
            options = {
              desc = "Fzf lsp_finder";
            };
          };

          "<leader>fi" = {
            action = "lsp_incoming_calls";
            options = {
              desc = "Fzf lsp_incoming_calls";
            };
          };

          "<leader>fr" = {
            action = "lsp_references";
            options = {
              desc = "Fzf lsp_references";
            };
          };

          "<leader>fn" = {
            action = "lsp_implementations";
            options = {
              desc = "Fzf lsp_implementations";
            };
          };

          "<leader>fd" = {
            action = "lsp_definitions";
            options = {
              desc = "Fzf lsp_definitions";
            };
          };

          "<leader>fD" = {
            action = "lsp_declarations";
            options = {
              desc = "Fzf lsp_declarations";
            };
          };

          "<leader>fw" = {
            action = "lsp_typedefs";
            options = {
              desc = "Fzf lsp_typedefs";
            };
          };

          "<leader>fh" = {
            action = "help_tags";
            options = {
              desc = "Fzf help_tags";
            };
          };

          "<leader>fH" = {
            action = "highlights";
            options = {
              desc = "Fzf highlights";
            };
          };

          "<leader>fM" = {
            action = "man_pages";
            options = {
              desc = "Fzf man_pages";
            };
          };

          "<leader>fj" = {
            action = "jumps";
            options = {
              desc = "Fzf jumplist";
            };
          };

          "<leader>ft" = {
            action = "registers";
            options = {
              desc = "Fzf registers";
            };
          };

          "<leader>b" = {
            action = "buffers";
            options = {
              desc = "Fzf buffers";
            };
          };

          "<leader>p" = {
            action = "oldfiles";
            options = {
              desc = "Fzf oldfiles";
            };
          };
        };
      };
    };
  };
}
