{config, ...}: {
  programs.kitty = {
    enable = true;
    font.name = "CommitMono";
    settings = {
      allow_remote_control = true;
      enabled_layouts = "tall";
      background = "#${config.colorScheme.palette.base00}";
      foreground = "#${config.colorScheme.palette.base05}";
      selection_background = "#${config.colorScheme.palette.base02}";
      selection_foreground = "none";
      cursor = "#${config.colorScheme.palette.base0A}";
      cursor_text_color = "#000000";
      #: black
      color0 = "#${config.colorScheme.palette.base00}";
      color8 = "#${config.colorScheme.palette.base01}";
      #: red
      color1 = "#${config.colorScheme.palette.base08}";
      color9 = "#${config.colorScheme.palette.base08}";
      #: yellow
      color3 = "#${config.colorScheme.palette.base0B}";
      color11 = "#${config.colorScheme.palette.base0B}";
      #: blue
      color4 = "#${config.colorScheme.palette.base0C}";
      color12 = "#${config.colorScheme.palette.base0D}";
      #: magenta
      color5 = "#${config.colorScheme.palette.base04}";
      color13 = "#${config.colorScheme.palette.base04}";
      #: white
      color7 = "#${config.colorScheme.palette.base05}";
      color15 = "#${config.colorScheme.palette.base06}";
      #: green
      color2 = "#${config.colorScheme.palette.base0D}";
      color10 = "#${config.colorScheme.palette.base0D}";
      #: cyan
      color6 = "#${config.colorScheme.palette.base0E}";
      color14 = "#${config.colorScheme.palette.base0E}";
    };
  };
}
