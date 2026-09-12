{config, ...}: let
  palette = config.colorScheme.palette;
in {
  programs.kitty = {
    enable = true;
    font.name = "CommitMono";
    settings = {
      allow_remote_control = true;
      enabled_layouts = "tall";
      background = "#${palette.base00}";
      foreground = "#${palette.base05}";
      selection_background = "#${palette.base02}";
      selection_foreground = "none";
      cursor = "#${palette.base0A}";
      cursor_text_color = "#000000";
      #: black
      color0 = "#${palette.base00}";
      color8 = "#${palette.base01}";
      #: red
      color1 = "#${palette.base0E}";
      color9 = "#${palette.base0E}";
      #: yellow
      color3 = "#${palette.base0B}";
      color11 = "#${palette.base0F}";
      #: blue
      color4 = "#${palette.base0C}"; ## tmux
      color12 = "#${palette.base04}";
      #: magenta
      color5 = "#${palette.base04}";
      color13 = "#${palette.base0C}";
      #: white
      color7 = "#${palette.base05}";
      color15 = "#${palette.base06}";
      #: green
      color2 = "#${palette.base0C}";
      color10 = "#${palette.base0A}";
      #: cyan
      color6 = "#${palette.base0E}";
      color14 = "#${palette.base0D}";
    };
  };
}
