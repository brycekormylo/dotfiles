{
  services = {
    logind.powerKey = "suspend";

    power-profiles-daemon.enable = false;

    # battery info
    upower.enable = true;
  };
}
