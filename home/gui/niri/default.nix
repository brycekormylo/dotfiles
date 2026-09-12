{
  imports = [
    ./waybar
  ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;
  home.file.".config/colours.css".text = ''
    @define-color main-bg #1e1e2e;
    @define-color main-fg #cdd6f4;
  '';
}
