{pkgs, ...}: {
  programs.niri = {
    enable = true;
  };

  systemd.user.services.niri.enableDefaultPath = false;

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
  };

  services = {
    dbus = {
      enable = true;
      implementation = "broker";
      packages = with pkgs; [
        gcr
        gnome-settings-daemon
      ];
    };

    displayManager = {
      defaultSession = "niri";
      autoLogin.enable = true;
      autoLogin.user = "bryce";
    };
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    alacritty
    fuzzel
    swaylock
    mako
    swayidle
    wl-clipboard
    wl-clip-persist
  ];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = ["gtk"];
    };

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
}
