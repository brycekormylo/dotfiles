{
  services = {
    logind.settings.Login.HandlePowerKey = "suspend";

    power-profiles-daemon.enable = false;

    # battery info
    upower.enable = true;
  };
}
