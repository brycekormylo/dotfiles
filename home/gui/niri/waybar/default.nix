{lib, ...}: {
  programs.waybar = {
    enable = true;
  };

  xdg.configFile."waybar/config".source = ./config.jsonc;
  xdg.configFile."waybar/style.css".source = lib.mkForce ./style.css;
}
