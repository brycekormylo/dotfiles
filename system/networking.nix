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
      dnssec = "true";
      domains = ["~."];
      fallbackDns = ["1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one"];
      dnsovertls = "opportunistic";
    };

    # Not blocking
    #blocky = {
    #enable = true;
    #settings = {
    #ports.dns = 53; # Port for incoming DNS Queries.
    ## upstreams.groups.default = [
    ##   "127.0.0.53" # Using Cloudflare's DNS over HTTPS server for resolving queries.
    ## ];
    ## # For initially solving DoH/DoT Requests when no system Resolver is available.
    ## bootstrapDns = {
    ##   upstream = "https://one.one.one.one/dns-query";
    ##   ips = ["1.1.1.1" "1.0.0.1"];
    ## };
    #blocking = {
    #blackLists = {
    #ads = [
    #"https://blocklistproject.github.io/Lists/ads.txt"
    #];
    #malicious = [
    #"https://blocklistproject.github.io/Lists/adguard/malware-ags.txt"
    #];
    #focus = [
    #''
    #|
    #*youtube*
    #*facebook*
    #''
    #];
    #};
    #clientGroupsBlock = {
    #default = ["ads" "malicious" "focus"];
    #};
    #};
    #};
    #};
  };

  systemd.services.NetworkManager-wait-online.serviceConfig.ExecStart = ["" "${pkgs.networkmanager}/bin/nm-online -q"];
}
