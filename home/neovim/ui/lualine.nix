{config, ...}: let
  colors = config.colorScheme.palette;
in {
  programs.nixvim = {
    plugins.lualine = {
      enable = true;
    };
    extraConfigLua =
      /*
      lua
      */
      ''
        local palette = require("palette.theme")

        local colors = {
        	black = '#${colors.base00}',
        	white = '#${colors.base08}',
        	red = '#${colors.base0B}',
        	green = '#${colors.base0A}',
        	blue = '#${colors.base03}',
        	yellow = '#${colors.base0F}',
        	gray = '#${colors.base06}',
        	darkgray = '#${colors.base01}',
        	lightgray = '#${colors.base02}',
        }

        local custom_theme = {
        	normal = {
        		a = { bg = colors.gray, fg = colors.black, gui = "bold" },
        		b = { bg = colors.lightgray, fg = colors.white },
        		c = { bg = palette.main.color1, fg = colors.blue },
        	},
        	terminal = {
        		a = { bg = colors.gray, fg = colors.black, gui = "bold" },
        		b = { bg = colors.lightgray, fg = colors.white },
        		c = { bg = palette.main.color1, fg = colors.gray },
        	},
        	insert = {
        		a = { bg = colors.green, fg = colors.black, gui = "bold" },
        		b = { bg = colors.lightgray, fg = colors.white },
        		c = { bg = palette.main.color1, fg = colors.gray },
        	},
        	visual = {
        		a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
        		b = { bg = colors.lightgray, fg = colors.white },
        		c = { bg = palette.main.color1, fg = colors.black },
        	},
        	replace = {
        		a = { bg = colors.red, fg = colors.black, gui = "bold" },
        		b = { bg = colors.lightgray, fg = colors.white },
        		c = { bg = palette.main.color1, fg = colors.gray },
        	},
        	command = {
        		a = { bg = colors.gray, fg = colors.black, gui = "bold" },
        		b = { bg = colors.lightgray, fg = colors.white },
        		c = { bg = palette.main.color1, fg = colors.gray },
        	},
        	inactive = {
        		a = { bg = palette.main.color1, fg = colors.gray, gui = "bold" },
        		b = { bg = palette.main.color1, fg = colors.gray },
        		c = { bg = palette.main.color1, fg = colors.gray },
        	},
        }

        local function wordcount()
          local wc = vim.api.nvim_eval("wordcount()")
          if wc["visual_words"] then
            return wc["visual_words"]
          else
            return wc["words"]
          end
        end

        local function screenkey()
          return require("screenkey").get_keys()
        end

        vim.g.screenkey_statusline_component = true

        vim.keymap.set("n", "<leader><leader>l", function()
            vim.g.screenkey_statusline_component = not vim.g.screenkey_statusline_component
        end, { desc = "Toggle screenkey statusline component" })

        require("lualine").setup({
          options = {
            theme = custom_theme
          },

          sections = {
            lualine_x = {
              screenkey,
              {
                'filetype',
                colored = false,
                icon = {
                  align = 'right'
                },
              }
            },

            lualine_y = {
              wordcount
            },

            lualine_z = {
              {'location'}
            },

            lualine_c = {
              {
                'filename',
                file_status = true,
                newfile_status = false,
                path = 1,
                symbols = {
                  modified = '[+]',
                  readonly = '[-]',
                  unnamed = '[No Name]',
                  newfile = '[New]',
                }
              }
            }
          }
        })
      '';
  };
}
