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
      color1 = "#${palette.base08}";
      color9 = "#${palette.base08}";
      #: yellow
      color3 = "#${palette.base0B}";
      color11 = "#${palette.base0B}";
      #: blue
      color4 = "#${palette.base0C}";
      color12 = "#${palette.base0D}";
      #: magenta
      color5 = "#${palette.base04}";
      color13 = "#${palette.base04}";
      #: white
      color7 = "#${palette.base05}";
      color15 = "#${palette.base06}";
      #: green
      color2 = "#${palette.base0D}";
      color10 = "#${palette.base0D}";
      #: cyan
      color6 = "#${palette.base0E}";
      color14 = "#${palette.base0E}";
    };
  };
}
