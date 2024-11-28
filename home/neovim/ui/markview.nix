{
  programs.nixvim = {
    plugins.markview = {
      enable = true;
    };
    extraConfigLua = ''
      local markview = require("markview")
      local presets = require("markview.presets")

      local main = require("palette.theme").main
      local accent = require("palette.theme").accent

      markview.setup({
      	highlight_groups = {
      		{
      			group_name = "Heading1",
      			value = { fg = accent.accent3, bg = main.color1 },
      		},
      		{
      			group_name = "Heading1Sign",
      			value = { fg = accent.accent3, bg = main.color0 },
      		},
      		{
      			group_name = "Heading2",
      			value = { fg = accent.accent5, bg = main.color1 },
      		},
      		{
      			group_name = "Heading2Sign",
      			value = { fg = accent.accent5, bg = main.color0 },
      		},
      		{
      			group_name = "Heading3",
      			value = { fg = accent.accent4, bg = main.color1 },
      		},
      		{
      			group_name = "Heading3Sign",
      			value = { fg = accent.accent4, bg = main.color0 },
      		},
      		{
      			group_name = "HorizontalRules",
      			value = { fg = accent.accent3, bg = main.color0 },
      		},
      		{
      			group_name = "Link",
      			value = { fg = accent.accent1 },
      		},
      		{
      			group_name = "ListItems",
      			value = { fg = accent.accent2 },
      		},
      	},

      	headings = {
      		enable = true,
      		shift_width = 2,

      		heading_1 = {
      			style = "label",
      			align = "left",
      			hl = "MarkviewHeading1",
      			padding_left = "▋ ",
      			padding_right = "  ",
      			corner_left_hl = "MarkviewHeading1",
      			sign = "󰌕 ",
      			sign_hl = "MarkviewHeading1Sign",
      			icon = "",
      			icon_hl = "MarkviewHeading1",
      		},

      		heading_2 = {
      			style = "label",
      			align = "left",
      			hl = "MarkviewHeading2",
      			padding_left = "▋  ",
      			padding_right = "   ",
      			corner_left_hl = "MarkviewHeading2",
      			padding_left_hl = nil,
      			padding_right_hl = nil,
      			corner_right_hl = "MarkviewHeading2",
      			sign = "󰌕 ",
      			sign_hl = "MarkviewHeading2Sign",
      			icon = "",
      			icon_hl = "MarkviewHeading2",
      		},

      		heading_3 = {
      			style = "label",
      			align = "left",
      			hl = "MarkviewHeading3",
      			padding_left = "▋   ",
      			padding_right = "    ",
      			corner_left_hl = "MarkviewHeading3",
      			padding_left_hl = nil,
      			padding_right_hl = nil,
      			corner_right_hl = "MarkviewHeading3",
      			sign = "󰌕 ",
      			sign_hl = "MarkviewHeading3Sign",
      			icon = "",
      			icon_hl = "MarkviewHeading3",
      		},

      		setext_1 = {
      			hl = "MarkviewHeading1",
      			sign = "󰌕 ",
      			sign_hl = "MarkviewHeading1Sign",
      			icon = "  ",
      			icon_hl = "MarkviewHeading1",
      			border = "▂",
      			border_hl = "MarkviewHeading1",
      		},

      		setext_2 = {
      			hl = "MarkviewHeading2",
      			sign = "󰌕 ",
      			sign_hl = "MarkviewHeading2Sign",
      			icon = "  ",
      			icon_hl = "MarkviewHeading2",
      			border = "▂",
      			border_hl = "MarkviewHeading2",
      		},
      	},

      	horizontal_rules = {
      		enable = true,
      		parts = {
      			{
      				type = "text",
      				text = "  ",
      				hl = "HorizontalRules",
      			},
      			{
      				type = "repeating",
      				repeat_amount = 20,
      				text = "─",
      				hl = {
      					"HorizontalRules",
      				},
      				direction = "left",
      			},
      			{
      				type = "text",
      				text = "  ",
      				hl = "HorizontalRules",
      			},
      		},
      	},
      	code_blocks = {
      		enable = true,
      		icons = "mini",
      		style = "minimal",
      		hl = "CursorLine",
      	},

      	links = {
      		enable = true,
      		hyperlinks = {
      			hl = "Link",
      		},
      	},

      	list_items = {
      		enable = true,
      		shift_width = 1,
      		marker_minus = {
      			text = "",
      			hl = "ListItems",
      		},
      		marker_plus = {
      			text = "",
      			hl = "ListItems",
      		},
      		marker_star = {
      			text = "",
      			hl = "ListItems",
      		},
      	},
      })

      vim.cmd("Markview enableAll")
    '';
  };
}
