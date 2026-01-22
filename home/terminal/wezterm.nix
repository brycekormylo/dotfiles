{config, ...}: let
  palette = config.colorScheme.palette;
in {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        font = wezterm.font_with_fallback({
          "Commit Mono",
        }),
        font_size = 11,
        hide_tab_bar_if_only_one_tab = true,

        colors = {
            background = "#${palette.base00}",
            foreground = "#${palette.base05}",
            selection_bg = "#${palette.base02}",
            selection_fg = "none",
            ansi = {
               "#${palette.base00}", -- 'black',
               "#${palette.base0E}", -- 'maroon',
               "#${palette.base0C}", -- 'green',
               "#${palette.base0E}", -- 'olive',
               "#${palette.base0C}", -- 'navy',
               "#${palette.base04}", -- 'purple',
               "#${palette.base0E}", -- 'teal',
               "#${palette.base05}", -- 'silver',
            },
            brights = {
                "#${palette.base01}", -- 'grey',
                "#${palette.base0E}", -- 'red',
                "#${palette.base0A}", -- 'lime',
                "#${palette.base0F}", -- 'yellow',
                "#${palette.base04}", -- 'blue',
                "#${palette.base0C}", -- 'fuchsia',
                "#${palette.base0D}", -- 'aqua',
                "#${palette.base02}", -- 'white',
            },
        }
      }
    '';

    # return {
    #   font = wezterm.font_with_fallback({
    #     "Commit Mono",
    #   }),
    #   font_size = 11,
    #   hide_tab_bar_if_only_one_tab = true,
    #
    #   colors = {
    #       background = "#32302F",
    #       foreground = "#BDAE93",
    #       selection_bg = "#504945",
    #       selection_fg = "none",
    #       ansi = {
    #          "#32302F", -- 'black',
    #          "#9FC2B1", -- 'maroon',
    #          "#8BCCA5", -- 'green',
    #          "#9FC2B1", -- 'olive',
    #          "#8BCCA5", -- 'navy',
    #          "#72837C", -- 'purple',
    #          "#9FC2B1", -- 'teal',
    #          "#BDAE93", -- 'silver',
    #       },
    #       brights = {
    #           "#282828", -- 'grey',
    #           "#9FC2B1", -- 'red',
    #           "#A7D6AA", -- 'lime',
    #           "#EB7757", -- 'yellow',
    #           "#72837C", -- 'blue',
    #           "#8BCCA5", -- 'fuchsia',
    #           "#DA9B58", -- 'aqua',
    #           "#504945", -- 'white',
    #       },
    #   }
    # }
    # settings = {
    #   allow_remote_control = true;
    #   enabled_layouts = "tall";
    #   background = "#${palette.base00}";
    #   foreground = "#${palette.base05}";
    #   selection_background = "#${palette.base02}";
    #   selection_foreground = "none";
    #   cursor = "#${palette.base0A}";
    #   cursor_text_color = "#000000";
    #   #: black
    #   color0 = "#${palette.base00}";
    #   color8 = "#${palette.base01}";
    #   #: red
    #   color1 = "#${palette.base0E}";
    #   color9 = "#${palette.base0E}";
    #   #: yellow
    #   color3 = "#${palette.base0B}";
    #   color11 = "#${palette.base0F}";
    #   #: blue
    #   color4 = "#${palette.base0C}"; ## tmux
    #   color12 = "#${palette.base04}";
    #   #: magenta
    #   color5 = "#${palette.base04}";
    #   color13 = "#${palette.base0C}";
    #   #: white
    #   color7 = "#${palette.base05}";
    #   color15 = "#${palette.base06}";
    #   #: green
    #   color2 = "#${palette.base0C}";
    #   color10 = "#${palette.base0A}";
    #   #: cyan
    #   color6 = "#${palette.base0E}";
    #   color14 = "#${palette.base0D}";
    # };
  };
}
