{pkgs, ...}: {
  networking = {
    hostName = "pathfinder";
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };
    firewall.allowedTCPPorts = [61458 61459 2416];
    nameservers = ["1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one"];
  };

  services = {
    # openssh = {
    #   enable = true;
    #   settings.UseDns = true;
    # };

    # DNS resolver
    resolved = {
      enable = true;
      settings.Resolve = {
        DNSSEC = "true";
        Domains = ["~."];
        FallbackDNS = ["1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one"];
        DNSOverTLS = "opportunistic";
      };
    };
  };

  systemd.services.NetworkManager-wait-online.serviceConfig.ExecStart = ["" "${pkgs.networkmanager}/bin/nm-online -q"];
}
