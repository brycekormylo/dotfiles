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
        		c = { bg = colors.darkgray, fg = colors.blue },
        	},
        	terminal = {
        		a = { bg = colors.gray, fg = colors.black, gui = "bold" },
        		b = { bg = colors.lightgray, fg = colors.white },
        		c = { bg = colors.darkgray, fg = colors.gray },
        	},
        	insert = {
        		a = { bg = colors.green, fg = colors.black, gui = "bold" },
        		b = { bg = colors.lightgray, fg = colors.white },
        		c = { bg = colors.lightgray, fg = colors.white },
        	},
        	visual = {
        		a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
        		b = { bg = colors.lightgray, fg = colors.white },
        		c = { bg = colors.darkgray, fg = colors.black },
        	},
        	replace = {
        		a = { bg = colors.red, fg = colors.black, gui = "bold" },
        		b = { bg = colors.lightgray, fg = colors.white },
        		c = { bg = colors.black, fg = colors.white },
        	},
        	command = {
        		a = { bg = colors.gray, fg = colors.black, gui = "bold" },
        		b = { bg = colors.lightgray, fg = colors.white },
        		c = { bg = colors.darkgray, fg = colors.gray },
        	},
        	inactive = {
        		a = { bg = colors.darkgray, fg = colors.gray, gui = "bold" },
        		b = { bg = colors.darkgray, fg = colors.gray },
        		c = { bg = colors.darkgray, fg = colors.gray },
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

        require("lualine").setup({
          options = { theme = custom_theme },
          sections = {
            lualine_y = {
            wordcount
          },

          lualine_x = {
            {
              'filetype',
              colored = false,
              icon = {
                align = 'right'
              },
            }
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
        }})
      '';
  };
}
