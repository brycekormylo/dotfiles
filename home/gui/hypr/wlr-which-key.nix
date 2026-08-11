{
  pkgs,
  lib,
  ...
}: let
  mkMenu = menu: let
    configFile =
      pkgs.writeText "config.yaml"
      (lib.generators.toYAML {} {
        anchor = "center";
        font = "Commit Mono";
        border_width = 0.4;
        corner_r = 6;
        padding = 12;
        inherit menu;
      });
  in
    pkgs.writeShellScriptBin "my-menu" ''
      exec ${lib.getExe pkgs.wlr-which-key} ${configFile}
    '';
in {
  wayland.windowManager.hyprland.settings.bind = [
    ("SUPER, D, exec, "
      + lib.getExe (mkMenu [
        {
          key = "f";
          desc = "Firefox";
          cmd = "firefox";
        }
        # {
        #   key = "p";
        #   desc = "Floorp";
        #   cmd = "floorp && qbittorrent";
        # }
      ]))
  ];
}
