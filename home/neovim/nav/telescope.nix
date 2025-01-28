{
  programs.nixvim = {
    plugins = {
      telescope = {
        enable = true;

        extensions = {
          fzf-native.enable = true;
          ui-select.enable = true;
          frecency.enable = true;
        };

        keymaps = {
          "<leader>fa" = "find_files";
          "<leader>fz" = "live_grep";
          "<leader>fs" = "lsp_workspace_symbols";
          "<leader>fp" = "treesitter"; # Active buffer only

          "<leader>ff" = "resume";
          "<leader>F" = "resume";

          "<leader>fe" = "diagnostics";
          "<leader>fq" = "quickfix";

          "<leader>fi" = "lsp_incoming_calls"; # Better than references
          "<leader>fr" = "lsp_references"; # Includes imports
          "<leader>fn" = "lsp_implementations";
          "<leader>fd" = "lsp_definitions";

          "<leader>fw" = "lsp_type_definitions";
          "<leader>fo" = "lsp_outgoing_calls";

          "<leader>fh" = "help_tags";
          "<leader>fm" = "man_pages";
          "<leader>fj" = "jumplist";
          "<leader>ft" = "registers";

          "<leader>b" = "buffers";
          "<C-p>" = "git_files";
          "<leader>p" = "oldfiles";
          "<C-f>" = "live_grep";
        };

        settings = {
          defaults = {
            file_ignore_patterns = [
              "*.ico"
              "*.riv"
              "*.next"
              "^.git/"
              "^.mypy_cache/"
              "^__pycache__/"
              "^output/"
              "^data/"
              "%.ipynb"
            ];

            path_display = ["filename_first"];
            set_env.COLORTERM = "truecolor";
            layout_config = {
              prompt_position = "top";
            };
            sorting_strategy = "ascending";
          };
        };

        luaConfig.post =
          #lua
          ''
            local layout_strategies = require("telescope.pickers.layout_strategies")

            layout_strategies.horizontal_fused = function(picker, max_columns, max_lines, layout_config)
            	local layout = layout_strategies.horizontal(picker, max_columns, max_lines, layout_config)
            	layout.prompt.title = ""
            	layout.results.title = ""
            	layout.preview.title = ""
            	layout.prompt.borderchars = { "─", "│", "─", "│", "╭", "┬", "┤", "├" }
            	layout.preview.borderchars = { "─", "│", "─", " ", "─", "╮", "╯", "─" }
            	layout.results.borderchars = { " ", "│", "─", "│", "│", "│", "┴", "╰" }
            	layout.max_columns = 80
            	return layout
            end

            layout_strategies.vertical_fused = function(picker, max_columns, max_lines, layout_config)
            	local layout = layout_strategies.vertical(picker, max_columns, max_lines, layout_config)
            	layout.prompt.title = ""
            	layout.results.title = ""
            	layout.preview.title = ""
            	layout.prompt.borderchars = { "─", "│", "─", "│", "╭", "╮", "┤", "├" }
            	layout.results.borderchars = { " ", "│", " ", "│", "│", "│", "│", "│" }
            	layout.preview.borderchars = { "─", "│", "─", "│", "├", "┤", "╯", "╰" }
            	return layout
            end

            local horizontal_width = 0.8
            local horizontal_height = 0.8

            require("telescope").setup({
            	defaults = {
            		layout_strategy = "horizontal_fused",
            		layout_config = {
            			width = horizontal_width,
            			height = horizontal_height,
            			horizontal = {
            				preview_cutoff = 80, --forces stretch on half-windows
            			},
            		},
            		mappings = {
            			i = {
            				["<esc>"] = require("telescope.actions").close,
            			},
            		},
            	},

            	pickers = {

            		buffers = {
            			layout_strategy = "vertical_fused",
            			layout_config = {
            				mirror = true,
            				width = 0.5,
            				height = 0.8,
            			},
            		},
            	},
            })
          '';
      };
    };
  };
}
