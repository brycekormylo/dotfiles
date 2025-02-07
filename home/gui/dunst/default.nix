{config, ...}: {
  services = {
    dunst = {
      enable = true;
      settings = {
        global = {
          width = 500;
          corner_radius = 4;
          offset = "10x10";
          origin = "top-right";
          transparency = 10;
          frame_color = "#${config.colorScheme.palette.base0A}";
          frame_width = 1;
          font = "CommitMono";
        };

        urgency_normal = {
          background = "#${config.colorScheme.palette.base00}";
          foreground = "#${config.colorScheme.palette.base05}";
          timeout = 5;
        };
      };
    };
  };
}
