{
  config,
  lib,
  ...
}: {
  services.greetd = let
    session = {
      command = "${lib.getExe config.programs.uwsm.package} start hyprland-uwsm.desktop";
      user = "bryce";
    };
  in {
    enable = true;
    settings = {
      terminal.vt = 1;
      default_session = session;
      initial_session = session;
    };
  };

  # programs = {
  #   uwsm = {
  #     enable = true;
  #     waylandCompositors = {
  #       hyprland = {
  #         prettyName = "Hyprland";
  #         comment = "Hyprland compositor managed by UWSM";
  #         binPath = "/run/current-system/sw/bin/Hyprland";
  #       };
  #     };
  #   };
  # };
}
