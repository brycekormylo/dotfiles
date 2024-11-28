{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./system
    # TODO: ./disk-config.nix
  ];

  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 12;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "pathfinder";
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [61458 61459 2416];

  time.timeZone = "America/Los_Angeles";

  i18n.defaultLocale = "en_US.UTF-8";

  services.displayManager = {
    defaultSession = "hyprland";
    autoLogin.enable = true;
    autoLogin.user = "bryce";
  };

  services.xserver = {
    enable = true;
    videoDrivers = ["nvidia"];
    autorun = true;
    xkb.layout = "us";
    xkb.variant = "";
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  boot.kernelParams = ["intel_pstate=disable"];
  services.power-profiles-daemon.enable = false;
  services.thermald.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "schedutil";
      CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";
      CPU_MIN_PERF_ON_AC = 800000;
      CPU_MAX_PERF_ON_AC = 4400000;
      CPU_MIN_PERF_ON_BAT = 800000;
      CPU_MAX_PERF_ON_BAT = 4400000;
    };
  };

  xdg.portal.enable = true;

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      open = true;
      modesetting.enable = true;
      nvidiaSettings = true;
      prime = {
        offload.enable = true;
        offload.enableOffloadCmd = true;
        nvidiaBusId = "PCI:1:0:0";
        intelBusId = "PCI:0:2:0";
      };
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.xfconf.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnails

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  security.rtkit.enable = true;
  security.polkit.enable = true;
  security.sudo = {
    wheelNeedsPassword = false;
    extraRules = [
      {
        users = ["bryce"];
        commands = [
          {
            command = "ALL";
            options = ["NOPASSWD" "SETENV"];
          }
        ];
      }
    ];
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.blueman.enable = true;

  programs.steam.enable = true;

  users.users.bryce = {
    isNormalUser = true;
    description = "bryce";
    extraGroups = ["networkmanager" "wheel"];
  };

  systemd.services."getty@tty1".enable = false; # Autologin
  systemd.services."autovt@tty1".enable = false;

  environment.systemPackages = with pkgs; [
    firefox
    librewolf
    obsidian
    ungoogled-chromium

    inkscape
    libreoffice
    vlc

    bluez
    brightnessctl
    gparted
    libdbusmenu-gtk3
    libnotify
    networkmanagerapplet
    usbview
    usbutils

    ffmpeg
    ffmpegthumbnailer
    libpng
    lsix
    mediainfo
    ueberzugpp

    grim
    slurp
    kooha

    bat
    fd
    imgp
    lux
    ripgrep
    unzip
    wget
    xdragon
    xidel
    zip

    gcc
    libgcc
    lld

    lshw
    nix-output-monitor
    nix-prefetch-github
    nvd

    egl-wayland
    gtk3
    hyprcursor
    hyprland
    hyprlang
    lxappearance
    nwg-look
    rofi-wayland
    swaybg
    wayland-protocols
    wayland-utils
    waypaper
    wl-clipboard
    wlroots
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xorg.xhost
    xwayland
  ];

  fonts.packages = with pkgs; [
    commit-mono
    meslo-lgs-nf
    nerdfonts
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = pkg: true;
  system.stateVersion = "24.11";

  nix.nixPath = [
    "nixpkgs=${inputs.nixpkgs}"
    "nixos-config=${config.users.users.bryce.home}/dot/configuration.nix"
  ];
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.optimise.automatic = true;
}
