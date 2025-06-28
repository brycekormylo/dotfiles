vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.backupdir = "~/.nvim/backup//"
vim.g.directory = "~/.nvim/swap//"
vim.g.undodir = "~/.nvim/undo//"

vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.opt.inccommand = "split"

vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.wo.number = true
vim.o.mouse = ""
vim.opt.cpoptions:append("I")
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.textwidth = 80
vim.o.conceallevel = 2
vim.o.concealcursor = ""
vim.o.shiftwidth = 4

vim.o.breakindent = true
vim.o.wrap = true
vim.o.wrap = true
vim.o.wrapmargin = 0
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = "yes"
vim.wo.relativenumber = true
vim.o.updatetime = 50
vim.o.timeoutlen = 1000
vim.o.scrolloff = 24
vim.o.cursorline = true

vim.o.completeopt = "menu,preview,noselect"

vim.o.termguicolors = true

-- [[ Disable auto comment on enter ]]
-- See :help formatoptions
vim.api.nvim_create_autocmd("FileType", {
	desc = "remove formatoptions",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

vim.g.netrw_liststyle = 0
vim.g.netrw_banner = 0

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

vim.keymap.set("n", "<leader>w", "<cmd>:wall<CR>", { desc = "Write all open buffers" })

require("snacks").setup({
	bigfile = {},
	quickfile = {},
	zen = {},
})

local colors = {
	base01 = "#282828",
	base00 = "#32302F",
	base02 = "#504945",
	base03 = "#665C54",
	base04 = "#72837C",
	base05 = "#BDAE93",
	base06 = "#D5C4A1",
	base07 = "#EBDBB2",
	base08 = "#FBF1C7",
	base09 = "#B2DBC7",
	base0A = "#A7D6AA",
	base0B = "#8FC2B6",
	base0C = "#8BCCA5",
	base0D = "#DA9B58",
	base0E = "#9FC2B1",
	base0F = "#EB7757",
}

require("lze").load({

	{
		"gruvbox",
		enabled = nixCats("general") or false,
		event = "DeferredUIEnter",
		after = function(_)
			require("gruvbox").setup({
				palette_overrides = {
					dark0_hard = "#1d2021",
					dark0 = "#32302f",
					dark0_soft = "#282828",
					dark1 = "#282828",
					dark2 = "#504945",
					dark3 = "#665c54",
					dark4 = "#7c6f64",

					light0_hard = "#f9f5d7",
					light0 = "#fbf1c7",
					light0_soft = "#f2e5bc",
					light1 = "#ebdbb2",
					light2 = "#d5c4a1",
					light3 = "#bdae93",
					light4 = "#a89984",

					bright_red = colors.base0F,
					bright_green = colors.base0C,
					bright_yellow = colors.base09,
					bright_blue = colors.base07,
					bright_purple = colors.base0E,
					bright_aqua = colors.base0A,
					bright_orange = colors.base0D,

					neutral_red = colors.base0F,
					neutral_green = colors.base0C,
					neutral_yellow = colors.base09,
					neutral_blue = colors.base0B,
					neutral_purple = colors.base0E,
					neutral_aqua = colors.base0A,
					neutral_orange = colors.base0D,

					faded_red = colors.base0F,
					faded_green = colors.base0C,
					faded_yellow = colors.base09,
					faded_blue = colors.base0B,
					faded_purple = colors.base0E,
					faded_aqua = colors.base0A,
					faded_orange = colors.base0D,

					dark_red_hard = "#792329",
					dark_red = "#722529",
					dark_red_soft = "#7b2c2f",
					light_red_hard = "#fc9690",
					light_red = "#fc9487",
					light_red_soft = "#f78b7f",

					dark_green_hard = "#5a633a",
					dark_green = "#62693e",
					dark_green_soft = "#686d43",
					light_green_hard = "#d3d6a5",
					light_green = "#d5d39b",
					light_green_soft = "#cecb94",

					dark_aqua_hard = "#3e4934",
					dark_aqua = "#49503b",
					dark_aqua_soft = "#525742",
					light_aqua_hard = "#e6e9c1",
					light_aqua = "#e8e5b5",
					light_aqua_soft = "#e1dbac",

					gray = "#928374",
				},

				overrides = {
					["@tag.builtin.tsx"] = { fg = colors.base0B },
					["@tag.tsx"] = { fg = colors.base0C },
					["@tag.attribute.tsx"] = { fg = colors.base0E },
					["Search"] = { fg = colors.base0E },
					["Keyword"] = { fg = colors.base0E },
					["VisualMode"] = { fg = colors.base0D },
					["Directory"] = { fg = colors.base0C },
					["Special"] = { fg = colors.base06 },
					["SpecialChar"] = { fg = colors.base06 },
					["Type"] = { fg = colors.base0B },
					["String"] = { fg = colors.base05 },
					["@variable"] = { fg = colors.base0A },
					["LspInlayHint"] = { fg = colors.base04 },
					["Operator"] = { fg = colors.base07 },
					["Delimiter"] = { fg = colors.base07 },
					["ErrorMessage"] = { fg = colors.base0D, bg = colors.base01 },
				},
			})

			vim.cmd.colorscheme("gruvbox")
		end,
	},

	{
		"blink.cmp",
		enabled = nixCats("general") or false,
		event = "DeferredUIEnter",
		on_require = "blink",
		after = function(plugin)
			require("blink.cmp").setup({
				keymap = {
					preset = "enter",
					["<Tab>"] = {
						"select_next",
						"snippet_forward",
						"fallback",
					},
					["<S-Tab>"] = {
						"select_prev",
						"snippet_backward",
						"fallback",
					},
				},
				completion = {
					list = {
						selection = { preselect = false, auto_insert = false },
					},
				},
				appearance = {
					nerd_font_variant = "mono",
				},
				signature = { enabled = true },
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
				},
			})
		end,
	},

	{
		"wilder.nvim",
		enabled = nixCats("general") or false,
		event = "DeferredUIEnter",
		load = function(name)
			vim.cmd.packadd(name)
			vim.cmd.packadd("fzf-lua")
		end,
		after = function(_)
			local wilder = require("wilder")
			wilder.setup({ modes = { ":", "/", "?" } })
			wilder.set_option(
				"renderer",
				wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
					border = "rounded",
					max_height = "30%", -- max height of the palette
					min_height = 0, -- set to the same as 'max_height' for a fixed height window
					max_width = "40%",
					min_width = "40%",
					prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
					reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
					highlighter = wilder.basic_highlighter(),
					left = { " ", wilder.popupmenu_devicons() },
				}))
			)
		end,
	},

	{
		"nvim-comment",
		enabled = nixCats("general") or false,
		event = "DeferredUIEnter",
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			require("nvim_comment").setup({
				comment_empty = false,
				line_mapping = "<leader>X",
				operator_mapping = "<leader>x",
			})
		end,
	},

	{
		"otter.nvim",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			require("otter").setup({
				handle_leading_whitespace = true,
			})
		end,
	},

	{
		"modicator.nvim",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			require("modicator").setup({
				show_warnings = false,
				highlights = {
					use_cursorline_background = true,
				},
				integration = {
					lualine = {
						enabled = true,
						mode_section = nil,
						highlight = "bg",
					},
				},
			})
		end,
	},

	{
		"dressing.nvim",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			require("dressing").setup()
		end,
	},

	{
		"vimplugin-encourage",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			require("encourage").setup({
				messages = {
					"pilot ejecting  ",
					"viper's got you in the pipe, 5x5",
					"eject now eject  ",
					"core break in progress  ",
					"destruct sequence engaged  ",
					"eject-system engaged  ",
					"protocol [03]  ",
					"it was fun.  ",
					"ain't over till it's over.  ",
					"until next time, then.  ",
					"second star to the right.  ",
					"go get 'em, tiger.  ",
					"make it so.  ",
					"see you on the other side.  ",
					"wait for the wheel.  ",
					"do not throw your shot.  ",
					"drop and burn 'em up.  ",
					"exhibit no restraint.  ",
					"rip and saw.  ",
					"code zero zero zero. destruct. zero.  ",
					"authorization alpha-alpha 3-0-5.  ",
					"have just the greatest day.  ",
					"avenge me.  ",
					"stay safe.  ",
					"situation normal.  ",
					"protocol <3  ",
					"fly, you fool.  ",
					"never give up. never surrender.  ",
					"in case of doubt, attack.  ",
					"you’re never beaten until you admit it.  ",
					"wrong us, shall we not revenge?  ",
					"tilt all are one.  ",
					"nothing but the rain.  ",
					"sometimes, you have to roll a hard six.  ",
					"and sometimes, when you fall, you fly.  ",
					"see you space cowboy...  ",
					"just another day at the office.  ",
					"end of line.  ",
					"fortune favors the bold.  ",
					"a leaf on the wind.  ",
					"you are who you choose to be.  ",
					"always.  ",
					"finish the fight.  ",
				},
			})
		end,
	},

	{
		"vimplugin-icon-picker",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			require("icon-picker").setup({ disable_legacy_commands = true })
			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
			vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts)
			vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
		end,
	},

	{
		"inc-rename.nvim",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
			vim.cmd.packadd("dressing.nvim")
		end,
		after = function(_)
			require("inc_rename").setup({
				input_buffer_type = "dressing",
			})
			vim.keymap.set("n", "<leader>cr", ":IncRename ")
		end,
	},

	{
		"vimplugin-reverb",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			require("reverb").setup({
				opts = {
					BufWrite = { path = "~/.vim/sounds/ttf2_kill.mp3", volume = 50 },
					-- QuitPre = { path = "~/.vim/sounds/kraber.mp3", volume = 100 },
					-- CursorMoved = { path = "~/.vim/sounds/alternator.mp3", volume = 100 },
					-- InsertCharPre = { path = "~/.vim/sounds/alternator.mp3", volume = 100 },
					-- CmdlineEnter = { path = "~/.vim/sounds/kraber.mp3", volume = 100 },
					-- CmdlineLeave = { path = "~/.vim/sounds/kraber.mp3", volume = 100 },
				},
			})
		end,
	},

	{
		"satellite.nvim",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			require("satellite").setup({
				width = 1,
			})
		end,
	},

	{
		"nvim-ts-autotag",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			require("nvim-ts-autotag").setup()
		end,
	},

	{
		"hmts.nvim",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			require("hmts").setup()
		end,
	},

	{
		"fidget.nvim",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			require("fidget").setup({
				{
					progress = {
						poll_rate = 0,
						suppress_on_insert = false,
						ignore_done_already = false,
						ignore_empty_message = false,
						clear_on_detach = function(client_id)
							local client = vim.lsp.get_client_by_id(client_id)
							return client and client.name or nil
						end,
						notification_group = function(msg)
							return msg.lsp_client.name
						end,
						ignore = {},
						display = {
							render_limit = 8,
							done_ttl = 6,
							done_icon = "✔",
							done_style = "Constant",
							progress_icon = { "dots" },
							progress_style = "WarningMsg",
							group_style = "Title",
							icon_style = "Question",
							priority = 30,
							skip_history = true,
							format_message = require("fidget.progress.display").default_format_message,
							format_annote = function(msg)
								return msg.title
							end,
							format_group_name = function(group)
								return tostring(group)
							end,
							overrides = {
								rust_analyzer = { name = "rust-analyzer" },
							},
						},
						lsp = {
							progress_ringbuf_size = 0,
							log_handler = false,
						},
					},
					notification = {
						poll_rate = 10,
						filter = vim.log.levels.INFO,
						history_size = 128,
						override_vim_notify = true,
						configs = {
							default = {
								iconOnLeft = false,
								infoAnnote = "⁝",
								warnAnnote = "",
								errorAnnote = "",
								debugAnnote = "",
							},
						},
						redirect = function(msg, level, opts)
							if opts and opts.on_open then
								return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
							end
						end,
						view = {
							stack_upwards = false,
							icon_separator = " ",
							group_separator = "---",
							group_separator_hl = "Comment",
							render_message = function(msg, cnt)
								return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
							end,
						},
						window = {
							normal_hl = "Comment",
							winblend = 100,
							border = "solid",
							zindex = 45,
							max_width = 100,
							max_height = 200,
							x_padding = 3,
							y_padding = 3,
							align = "top",
							relative = "editor",
						},
					},
					logger = {
						level = vim.log.levels.ERROR,
						max_size = 10000,
						float_precision = 0.01,
						path = string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
					},
				},
			})
		end,
	},

	{
		"vimplugin-relative-toggle",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			require("relative-toggle").setup({
				pattern = "*",
				events = {
					on = { "BufEnter", "FocusGained", "InsertLeave", "WinEnter", "CmdlineLeave" },
					off = { "BufLeave", "FocusLost", "InsertEnter", "WinLeave", "CmdlineEnter" },
				},
			})
		end,
	},

	{
		"vimplugin-gitgraph",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			require("gitgraph").setup({
				opts = {
					symbols = {
						merge_commit = "M",
						commit = "*",
					},
				},
			})
		end,
	},

	{
		"lazygit.nvim",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			vim.keymap.set("n", "<leader>L", "<cmd>:LazyGit<cr>", { desc = "LazyGit" })
		end,
	},

	{
		"diffview.nvim",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			require("diffview").setup({})
			vim.keymap.set("n", "<leader><leader>d", "<cmd>:DiffviewOpen<cr>", { desc = "Open Diffview" })
			vim.keymap.set("n", "<leader><leader>D", "<cmd>:DiffviewClose<cr>", { desc = "Close Diffview" })
		end,
	},

	{
		"nvim-surround",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			require("nvim-surround").setup()
		end,
	},

	{
		"package-info.nvim",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			require("package-info").setup()
		end,
	},

	{
		"mkdnflow.nvim",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			require("mkdnflow").setup()
		end,
	},

	{
		"markview.nvim",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			require("markview").setup()
		end,
	},

	{
		"nvim-colorizer.lua",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			require("colorizer").setup({
				user_default_options = {
					names = false,
					tailwind = true,
				},
			})
		end,
	},

	{
		"vimplugin-tiny-glimmer",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			require("tiny-glimmer").setup({
				enabled = true,
				disable_warnings = false,
				default_animation = "bounce",
				animations = {
					bounce = {
						max_duration = 500,
						min_duration = 300,
						oscillation_count = 2,
						from_color = "#32302f",
						to_color = "#72837c",
					},
				},
				overwrite = {
					auto_map = true,
					yank = {
						enabled = true,
						default_animation = "bounce",
					},
					search = {
						enabled = true,
						default_animation = "bounce",
					},
					paste = {
						enabled = false,
						default_animation = "bounce",
					},
					undo = {
						enabled = true,
						default_animation = "bounce",
					},
					redo = {
						enabled = true,
						default_animation = "bounce",
					},
				},
			})
		end,
	},

	{
		"smear-cursor.nvim",
		enabled = nixCats("general") or false,
		after = function(_)
			require("smear_cursor").setup({
				enabled = true,
				opts = {
					stiffness = 0.9,
					trailing_stiffness = 0.6,
					distance_stop_animating = 0.5,
					trailing_exponent = 2,
					slowdown_exponent = -0.2,
					smear_to_cmd = false,
					legacy_computing_symbols_support = true,
					hide_target_hack = false,
					smear_between_buffers = true,
					smear_insert_mode = false,
					distance_stop_animating_vertical_bar = 0.1,
					cursor_color = "#A7D6AA",
				},
			})
		end,
	},

	{
		"nvim-treesitter",
		enabled = nixCats("general") or false,
		event = "DeferredUIEnter",
		load = function(name)
			vim.cmd.packadd(name)
			vim.cmd.packadd("nvim-treesitter-textobjects")
		end,
		after = function(plugin)
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				indent = { enable = false },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<c-space>",
						node_incremental = "<c-space>",
						scope_incremental = "<c-s>",
						node_decremental = "<M-space>",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = "@class.outer",
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>s"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>S"] = "@parameter.inner",
						},
					},
				},
			})
		end,
	},

	{
		"nvim-treesitter-context",
		enabled = nixCats("general") or false,
		event = "DeferredUIEnter",
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(plugin)
			require("treesitter-context").setup()
		end,
	},

	{
		"mini.nvim",
		enabled = nixCats("general") or false,
		event = "DeferredUIEnter",
		after = function(_)
			require("mini.pairs").setup()
			require("mini.icons").setup()
		end,
	},

	{
		"aerial.nvim",
		enabled = nixCats("general") or false,
		event = "DeferredUIEnter",
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			require("aerial").setup()
			vim.keymap.set("n", "<leader>cw", "<cmd>AerialToggle!<cr>")
		end,
	},

	{
		"tiny-inline-diagnostic.nvim",
		enabled = nixCats("general") or false,
		event = "DeferredUIEnter",
		after = function(_)
			require("tiny-inline-diagnostic").setup()
		end,
	},

	{
		"vimplugin-screenkey",
		enabled = nixCats("general") or false,
		event = "DeferredUIEnter",
		load = function(name)
			vim.cmd.packadd(name)
		end,
		after = function(_)
			require("screenkey").setup({
				win_opts = {
					row = vim.o.lines - vim.o.cmdheight - 1,
					col = vim.o.columns,
					relative = "editor",
					anchor = "SE",
					width = 16,
					height = 3,
					border = "none",
					title = "",
					title_pos = "center",
					style = "minimal",
					focusable = false,
					noautocmd = true,
					zindex = 1,
				},
				compress_after = 3,
				clear_after = 3,
				disable = {
					filetypes = {},
					buftypes = {},
					events = false,
				},
				show_leader = true,
				group_mappings = true,
				display_infront = {},
				display_behind = {},
				filter = function(keys)
					return keys
				end,
				keys = {
					["<TAB>"] = "󰌒",
					["<CR>"] = "󰌑",
					["<ESC>"] = "",
					["<SPACE>"] = "␣",
					["<BS>"] = "",
					["<DEL>"] = "",
					["<LEFT>"] = "",
					["<RIGHT>"] = "",
					["<UP>"] = "",
					["<DOWN>"] = "",
					["<HOME>"] = "",
					["<END>"] = "󰨿",
					["<PAGEUP>"] = "⥣",
					["<PAGEDOWN>"] = "⥥",
					["<INSERT>"] = "",
					["<F1>"] = "󱊫",
					["<F2>"] = "󱊬",
					["<F3>"] = "󱊭",
					["<F4>"] = "󱊮",
					["<F5>"] = "󱊯",
					["<F6>"] = "󱊰",
					["<F7>"] = "󱊱",
					["<F8>"] = "󱊲",
					["<F9>"] = "󱊳",
					["<F10>"] = "󱊴",
					["<F11>"] = "󱊵",
					["<F12>"] = "󱊶",
					["CTRL"] = "",
					["ALT"] = "",
					["SUPER"] = "󰘳",
					["<leader>"] = "⎵",
				},
			})
		end,
	},

	{
		"vim-startuptime",
		enabled = nixCats("general") or false,
		cmd = { "StartupTime" },
		before = function(_)
			vim.g.startuptime_event_width = 0
			vim.g.startuptime_tries = 10
			vim.g.startuptime_exe_path = nixCats.packageBinPath
		end,
	},

	{
		"hlchunk.nvim",
		enabled = nixCats("general") or false,
		after = function(_)
			require("hlchunk").setup({
				chunk = {
					enable = true,
					duration = 0,
					delay = 0,
					style = {
						{ fg = "#665c54" },
						{ fg = "#ebdbb2" },
					},
					chars = {
						horizontal_line = "─",
						vertical_line = "│",
						left_top = "╭",
						left_bottom = "╰",
						right_arrow = "─",
					},
				},
				indent = {
					enable = true,
					chars = {
						"│",
					},
					style = {
						{ fg = "#3c3836" },
					},
					ahead_lines = 2,
					delay = 0,
					filter_list = {
						function(v)
							return v.level ~= 1
						end,
					},
				},
			})
		end,
	},

	{
		"oil.nvim",
		enabled = nixCats("general") or false,
		after = function(_)
			require("oil").setup({
				default_file_explorer = true,
				delete_to_trash = true,
				skip_confirm_for_simple_edits = true,
				lsp_file_method = {
					autosave_changes = true,
				},
				columns = { "icon" },
				view_options = {
					show_hidden = true,
					natural_order = true,
				},
				float = {
					padding = 2,
					max_width = 72,
				},
				win_options = {
					wrap = true,
				},
				keymaps = {
					["<C-c>"] = "actions.parent",
					["-"] = "actions.close",
					["<C-h>"] = "actions.select_split",
					["<C-l>"] = "actions.refresh",
					["<C-p>"] = "actions.preview",
					["<C-s>"] = "actions.select_vsplit",
					["<C-t>"] = "actions.select_tab",
					["<CR>"] = "actions.select",
					["_"] = "actions.open_cwd",
					["`"] = "actions.cd",
					["g."] = "actions.toggle_hidden",
					["g?"] = "actions.show_help",
					["g\\"] = "actions.toggle_trash",
					["gs"] = "actions.change_sort",
					["gx"] = "actions.open_external",
					["~"] = "actions.tcd",
				},
			})
			vim.keymap.set("n", "-", "<cmd>:Oil --float<cr>", { desc = "Oil float" })
		end,
	},

	{
		"telescope.nvim",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
			vim.cmd.packadd("plenary.nvim")
			vim.cmd.packadd("telescope-fzf-native.nvim")
			vim.cmd.packadd("telescope-ui-select.nvim")
		end,
		after = function(_)
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
					file_ignore_patterns = {
						"*.ico",
						"*.riv",
						"*.next",
						"^.git/",
						"^.mypy_cache/",
						"^__pycache__/",
						"^output/",
						"^data/",
						"%.ipynb",
					},
					path_display = { "filename_first" },
					sorting_strategy = "ascending",
					layout_strategy = "horizontal_fused",
					layout_config = {
						prompt_position = "top",
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

			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fa", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fz", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set(
				"n",
				"<leader>fs",
				builtin.lsp_workspace_symbols,
				{ desc = "Telescope LSP workspace symbols" }
			)
			vim.keymap.set(
				"n",
				"<leader>fp",
				builtin.treesitter,
				{ desc = "Telescope treesitter (active buffer only)" }
			)
			vim.keymap.set("n", "<leader>ff", builtin.resume, { desc = "Telescope resume last search" })
			vim.keymap.set("n", "<leader>F", builtin.resume, { desc = "Telescope resume last search" })
			vim.keymap.set("n", "<leader>fe", builtin.diagnostics, { desc = "Telescope diagnostics" })
			vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Telescope quickfix list" })
			vim.keymap.set("n", "<leader>fi", builtin.lsp_incoming_calls, { desc = "Telescope LSP incoming calls" })
			vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Telescope LSP references" })
			vim.keymap.set("n", "<leader>fn", builtin.lsp_implementations, { desc = "Telescope LSP implementations" })
			vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "Telescope LSP definitions" })
			vim.keymap.set("n", "<leader>fw", builtin.lsp_type_definitions, { desc = "Telescope LSP type definitions" })
			vim.keymap.set("n", "<leader>fo", builtin.lsp_outgoing_calls, { desc = "Telescope LSP outgoing calls" })
			vim.keymap.set("n", "<leader>fm", builtin.man_pages, { desc = "Telescope man pages" })
			vim.keymap.set("n", "<leader>fj", builtin.jumplist, { desc = "Telescope jumplist" })
			vim.keymap.set("n", "<leader>ft", builtin.registers, { desc = "Telescope registers" })
			vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope git files" })
			vim.keymap.set("n", "<leader>p", builtin.oldfiles, { desc = "Telescope old files" })
			vim.keymap.set("n", "<C-f>", builtin.live_grep, { desc = "Telescope live grep" })
		end,
	},

	{
		"grapple.nvim",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
			vim.cmd.packadd("nvim-web-devicons")
		end,
		after = function(_)
			require("grapple").setup({
				win_opts = {
					footer = "",
				},
			})
			vim.keymap.set("n", "<leader>a", "<cmd>Grapple toggle<cr>")
			vim.keymap.set("n", "<leader>h", "<cmd>Grapple toggle_tags<cr>")
		end,
	},

	{
		"lualine.nvim",
		enabled = nixCats("general") or false,
		event = "DeferredUIEnter",
		load = function(name)
			vim.cmd.packadd(name)
			vim.cmd.packadd("lualine-lsp-progress")
			vim.cmd.packadd("vimplugin-screenkey-nvim")
		end,
		after = function(plugin)
			local palette = {
				black = colors.base00,
				white = colors.base08,
				red = colors.base0B,
				green = colors.base0A,
				blue = colors.base03,
				yellow = colors.base0F,
				gray = colors.base05,
				darkgray = colors.base01,
				lightgray = colors.base02,
			}

			local custom_theme = {
				normal = {
					a = { bg = palette.gray, fg = colors.black, gui = "bold" },
					b = { bg = palette.lightgray, fg = colors.white },
					c = { bg = colors.base01, fg = palette.blue },
				},
				terminal = {
					a = { bg = palette.gray, fg = colors.black, gui = "bold" },
					b = { bg = palette.lightgray, fg = colors.white },
					c = { bg = colors.base01, fg = palette.gray },
				},
				insert = {
					a = { bg = palette.green, fg = colors.black, gui = "bold" },
					b = { bg = palette.lightgray, fg = colors.white },
					c = { bg = colors.base01, fg = palette.gray },
				},
				visual = {
					a = { bg = palette.yellow, fg = colors.black, gui = "bold" },
					b = { bg = palette.lightgray, fg = colors.white },
					c = { bg = colors.base01, fg = palette.black },
				},
				replace = {
					a = { bg = palette.red, fg = colors.black, gui = "bold" },
					b = { bg = palette.lightgray, fg = colors.white },
					c = { bg = colors.base01, fg = palette.gray },
				},
				command = {
					a = { bg = palette.gray, fg = colors.black, gui = "bold" },
					b = { bg = palette.lightgray, fg = colors.white },
					c = { bg = colors.base01, fg = palette.gray },
				},
				inactive = {
					a = { bg = colors.base01, fg = palette.gray, gui = "bold" },
					b = { bg = colors.base01, fg = palette.gray },
					c = { bg = colors.base01, fg = palette.gray },
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
				return require("screenkey").get_keys():gsub("%%", "")
			end

			vim.g.screenkey_statusline_component = true

			vim.keymap.set("n", "<leader><leader>l", function()
				vim.g.screenkey_statusline_component = not vim.g.screenkey_statusline_component
			end, { desc = "Toggle screenkey statusline component" })

			require("lualine").setup({
				options = {
					theme = custom_theme,
					component_separators = "",
					section_separators = { left = "", right = "" },
				},

				sections = {
					lualine_a = {
						{
							"mode",
							separator = { left = "", right = "" },
							right_padding = 2,
						},
					},
					lualine_y = {
						{
							"filetype",
							colored = false,
							icon = {
								align = "right",
							},
						},
					},
					lualine_x = {
						screenkey,
					},
					lualine_c = {
						{
							"filename",
							file_status = true,
							newfile_status = false,
							path = 1,
							symbols = {
								modified = "[+]",
								readonly = "[-]",
								unnamed = "[No Name]",
								newfile = "[New]",
							},
						},
					},
					lualine_z = {
						wordcount,
						{ "location", separator = { right = "" }, left_padding = 2 },
					},
				},
			})
		end,
	},

	{
		"gitsigns.nvim",
		enabled = nixCats("general") or false,
		event = "DeferredUIEnter",
		after = function(_)
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
			})
		end,
	},

	{
		"which-key.nvim",
		enabled = nixCats("general") or false,
		event = "DeferredUIEnter",
		after = function(plugin)
			require("which-key").setup({})
			require("which-key").add({
				{ "<leader><leader>", group = "buffer commands" },
				{ "<leader><leader>_", hidden = true },
				{ "<leader>c", group = "[c]ode" },
				{ "<leader>c_", hidden = true },
				{ "<leader>d", group = "[d]ocument" },
				{ "<leader>d_", hidden = true },
				{ "<leader>g", group = "[g]it" },
				{ "<leader>g_", hidden = true },
				{ "<leader>r", group = "[r]ename" },
				{ "<leader>r_", hidden = true },
				{ "<leader>f", group = "[f]ind" },
				{ "<leader>f_", hidden = true },
				{ "<leader>s", group = "[s]earch" },
				{ "<leader>s_", hidden = true },
				{ "<leader>t", group = "[t]oggles" },
				{ "<leader>t_", hidden = true },
				{ "<leader>w", group = "[w]orkspace" },
				{ "<leader>w_", hidden = true },
			})
		end,
	},

	{
		"nvim-lint",
		enabled = nixCats("general") or false,
		event = "FileType",
		after = function(_)
			require("lint").linters_by_ft = {
				bash = { "bash" },
				rust = { "clippy" },
				json = { "jsonlint" },
				javascript = { "biomejs" },
				typescript = { "biomejs" },
				javascriptreact = { "biomejs" },
				typescriptreact = { "biomejs" },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},

	{
		"conform.nvim",
		enabled = nixCats("general") or false,
		after = function(_)
			local conform = require("conform")
			conform.setup({
				format_on_save = {
					lsp_fallback = true,
					timeout_ms = 2000,
				},
				notify_on_error = true,
				formatters_by_ft = {
					lua = nixCats("lua") and { "stylua" } or nil,
					nix = { "alejandra", "stylua" },
					javascript = { "biome", "rustywind" },
					typescript = { "biome", "rustywind" },
					javascriptreact = { "biome", "rustywind" },
					typescriptreact = { "biome", "rustywind" },
					html = { "superhtml" },
					css = { "biome" },
					json = { "biome" },
					yaml = { "yamlfix" },
					rust = { "rustfmt", "leptosfmt" },
					bash = { "beautysh" },
				},
			})
		end,
	},

	{
		"lazydev.nvim",
		enabled = nixCats("lua") or false,
		cmd = { "LazyDev" },
		ft = "lua",
		after = function(_)
			require("lazydev").setup({
				library = {
					{ words = { "nixCats" }, path = (nixCats.nixCatsPath or "") .. "/lua" },
				},
			})
		end,
	},

	{
		"vimplugin-nvim-lsp-endhints",
		enabled = nixCats("general") or false,
		load = function(name)
			vim.cmd.packadd(name)
			vim.cmd.packadd("nvim-lspconfig")
		end,
		after = function(_)
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
			require("lspconfig").ts_ls.setup({
				settings = {
					typescript = {
						inlayHints = inlayHints,
					},
					javascript = {
						inlayHints = inlayHints,
					},
				},
			})
		end,
	},
})

local function lsp_on_attach(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")

	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")

	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end

require("lze").register_handlers(require("lzextras").lsp)
require("lze").h.lsp.set_ft_fallback(function(name)
	return dofile(nixCats.pawsible({ "allPlugins", "opt", "nvim-lspconfig" }) .. "/lsp/" .. name .. ".lua").filetypes
		or {}
end)

require("lze").load({
	{
		"nvim-lspconfig",
		enabled = nixCats("general") or false,
		on_require = { "lspconfig" },
		lsp = function(plugin)
			vim.lsp.config(plugin.name, plugin.lsp or {})
			vim.lsp.enable(plugin.name)
		end,
		before = function(_)
			vim.lsp.config("*", {
				on_attach = lsp_on_attach,
			})
		end,
	},

	{
		"lua_ls",
		enabled = nixCats("lua") or false,
		lsp = {
			filetypes = { "lua" },
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					hint = {
						enable = true,
					},
					formatters = {
						ignoreComments = true,
					},
					signatureHelp = { enabled = true },
					diagnostics = {
						globals = { "nixCats", "vim" },
						disable = { "missing-fields" },
					},
					telemetry = { enabled = false },
				},
			},
		},
	},

	{
		"ts_ls",
		enabled = nixCats("web") or false,
		lsp = {
			filetypes = { "ts", "tsx", "js", "jsx" },
			settings = {
				ts_ls = {},
			},
		},
	},

	{
		"tailwindcss",
		enabled = nixCats("web") or false,
		lsp = {
			filetypes = { "tsx", "jsx" },
			settings = {
				tailwindcss = {},
			},
		},
	},

	{
		"jsonls",
		enabled = nixCats("web") or false,
		lsp = {
			filetypes = { "json" },
			settings = {
				jsonls = {},
			},
		},
	},

	{
		"bashls",
		enabled = nixCats("bash") or false,
		lsp = {
			filetypes = { "sh" },
			settings = {
				bashls = {},
			},
		},
	},

	{
		"nixd",
		enabled = nixCats("nix") or false,
		lsp = {
			filetypes = { "nix" },
			settings = {
				nixd = {
					nixpkgs = {
						expr = nixCats.extra("nixdExtras.nixpkgs") or [[import <nixpkgs> {}]],
					},
					options = {
						nixos = {
							expr = nixCats.extra("nixdExtras.nixos_options"),
						},
						["home-manager"] = {
							expr = nixCats.extra("nixdExtras.home_manager_options"),
						},
					},
					formatting = {
						command = { "alejandra" },
					},
					diagnostic = {
						suppress = {
							"sema-escaping-with",
						},
					},
				},
			},
		},
	},
})
