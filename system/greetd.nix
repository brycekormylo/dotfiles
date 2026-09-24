{
  config,
  lib,
  ...
}: {
  services.greetd = let
    session = {
      command = "${config.programs.niri.package}/bin/niri-session";
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
}
