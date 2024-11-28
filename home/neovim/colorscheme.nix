{config, ...}: let
  palette = {
    base00 = "#32302F";
    base01 = "#3C3836";
    base02 = "#504945";
    base03 = "#665C54";
    base04 = "#72837C";
    base05 = "#BDAE93";
    base06 = "#D5C4A1";
    base07 = "#EBDBB2";
    base08 = "#FBF1C7";
    base09 = "#B2DBC7";
    base0A = "#A7D6AA";
    base0B = "#A3CFC4";
    base0C = "#8BCCA5";
    base0D = "#DA9B58";
    base0E = "#93C2AB";
    base0F = "#EB7757";
  };
in {
  programs.nixvim = {
    colorschemes.palette = {
      enable = true;
      settings = {
        palettes = {
          main = "main_tempest";
          accent = "accent_tempest";
          state = "state_tempest";
        };
        custom_palettes = {
          main = {
            main_tempest = {
              color0 = "${palette.base00}";
              color1 = "${palette.base01}"; # Highlight row / scrollbar
              color2 = "${palette.base0A}"; # Lualine normal mode
              color3 = "${palette.base04}"; # Line numbers / special (overriden)
              color4 = "${palette.base05}"; # Operators, delimiters
              color5 = "${palette.base06}"; # Lualine command mode, cmp text
              color6 = "${palette.base03}"; # Comments
              color7 = "${palette.base08}"; # Functions
              color8 = "${palette.base07}"; # Most text
            };
          };

          accent = {
            accent_tempest = {
              accent0 = "${palette.base0F}"; # Numbers
              accent1 = "${palette.base09}"; # Illuminate
              accent2 = "${palette.base0E}"; # Applies to nothing?
              accent3 = "${palette.base0D}"; # Hl Pair
              accent4 = "${palette.base0A}"; # ! / booleans
              accent5 = "${palette.base0B}"; # Found nothing
              accent6 = "${palette.base0C}";
            };
          };

          state = {
            state_tempest = {
              hint = "${palette.base0C}";
              info = "${palette.base0D}";
              ok = "${palette.base0B}";
              warning = "${palette.base0A}";
              error = "${palette.base0F}";
            };
          };
        };
      };
      luaConfig.post =
        /*
        lua
        */
        ''
          local colors = require("palette.theme")

          require("palette").setup({
          	custom_highlight_group = "Corrections",
          	custom_highlight_groups = {
          		Corrections = {
          			{
          				"@tag.builtin.tsx",
          				colors.accent.accent5,
          			},
          			{
          				"@tag.tsx",
          				colors.accent.accent6,
          			},
          			{
          				"@tag.attribute.tsx",
          				colors.accent.accent2,
          			},
          			{
          				"Search",
          				colors.accent.accent3,
          			},
          			{
          				"Keyword",
          				colors.accent.accent2,
          			},
          			{
          				"VisualMode",
          				colors.accent.accent2,
          			},
          			{
          				"Directory",
          				colors.accent.accent2,
          			},
          			{
          				"Special",
          				colors.main.color5,
          			},
          			{
          				"SpecialChar",
          				colors.main.color5,
          			},
          			{
          				"Type",
          				colors.accent.accent5,
          			},
          			{
          				"String",
          				colors.main.color4,
          			},
          			{
          				"@variable",
          				colors.accent.accent4,
          			},
          		},
          	},
          })

          vim.cmd([[colorscheme palette]])
        '';
    };
  };
}
