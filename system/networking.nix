{pkgs, ...}: {
  networking = {
    hostName = "pathfinder";
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };
    firewall.allowedTCPPorts = [61458 61459 2416];
  };

  services = {
    # openssh = {
    #   enable = true;
    #   settings.UseDns = true;
    # };

    # DNS resolver
    resolved = {
      enable = true;
      dnsovertls = "opportunistic";
    };
  };

  systemd.services.NetworkManager-wait-online.serviceConfig.ExecStart = ["" "${pkgs.networkmanager}/bin/nm-online -q"];
}
