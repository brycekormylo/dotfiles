{
  nixpkgs.config.packageOverrides = pkgs: {
    ivpn-service = pkgs.ivpn-service.override {
      buildGoModule = pkgs.buildGo122Module;
    };
  };

  services.ivpn.enable = true;
}
