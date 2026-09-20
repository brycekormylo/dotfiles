{
  lib,
  config,
  ...
}: {
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
          frame_color = lib.mkForce "#${config.colorScheme.palette.base0A}";
          frame_width = 1;
          font = lib.mkForce "CommitMono";
        };

        urgency_normal = {
          background = lib.mkForce "#${config.colorScheme.palette.base00}";
          foreground = lib.mkForce "#${config.colorScheme.palette.base05}";
          timeout = 5;
        };
      };
    };
  };
}
