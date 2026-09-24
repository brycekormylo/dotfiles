{
  pkgs,
  lib,
  config,
  ...
}: let
  lock = "${pkgs.systemd}/bin/loginctl lock-session";
  niri = "${pkgs.niri}/bin/niri";
  brillo = lib.getExe pkgs.brillo;
  timeout = 1200;
in {
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        before_sleep_cmd = lock;
        after_sleep_cmd = "${niri} msg action power-on-monitors";
        lock_cmd = "pgrep hyprlock || ${lib.getExe config.programs.hyprlock.package}";
      };

      listener = [
        {
          timeout = timeout - 10;
          on-timeout = "${brillo} -O; ${brillo} -u 500000 -S 10";
          on-resume = "${brillo} -I -u 250000";
        }
        {
          inherit timeout;
          on-timeout = "${niri} msg action power-off-monitors";
          on-resume = "${niri} msg action power-on-monitors";
        }
        {
          timeout = timeout + 600;
          on-timeout = lock;
        }
      ];
    };
  };
}
