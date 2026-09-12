{pkgs, ...}: let
  requiredDeps = with pkgs; [
    egl-wayland
    gtk3
    hyprcursor
    hyprland
    hyprlang
    libdbusmenu-gtk3
    lxappearance
    nwg-displays
    nwg-look
    # rofi
    swaybg
    wayland-protocols
    wayland-utils
    waypaper
    wl-clipboard
    wlroots
    xdg-desktop-portal-gtk # Might just be for a file picker
    xdg-desktop-portal-hyprland
    xorg.xhost
    xwayland
  ];

  guiDeps = with pkgs; [
    # gnome-control-center
    # resources
    # overskride
    # wlogout
  ];

  dependencies = requiredDeps ++ guiDeps;
in {
  environment.systemPackages = dependencies;

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    dconf.enable = true;
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
      defaultSession = "hyprland-uwsm";
      autoLogin.enable = true;
      autoLogin.user = "bryce";
    };
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = ["gtk"];
      hyprland.default = ["gtk" "hyprland"];
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
