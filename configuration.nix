{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [./hardware-configuration.nix];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "pathfinder";
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [61458 61459 2416];

  time.timeZone = "America/Los_Angeles";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  nixpkgs.config.packageOverrides = pkgs: {
    ivpn-service = pkgs.ivpn-service.override {
      buildGoModule = pkgs.buildGo122Module;
    };
  };

  services.ivpn.enable = true;

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
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnails

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  #  services.printing.enable = true;

  hardware.pulseaudio = {
    enable = false;
    support32Bit = true;
  };
  security.rtkit.enable = true;
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

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  environment.systemPackages = with pkgs; [
    firefox
    librewolf
    ungoogled-chromium

    vlc
    inkscape
    libreoffice
    obsidian

    dolphin-emu
    clipgrab
    qbittorrent
    soulseekqt
    nicotine-plus
    jackett

    brightnessctl
    bluez
    libdbusmenu-gtk3
    networkmanagerapplet
    zathura
    xfce.thunar
    pavucontrol
    pamixer
    pulseaudio
    libnotify
    lshw
    imgp
    lsix
    ffmpeg
    ffmpegthumbnailer
    mediainfo
    ueberzugpp
    grim
    slurp

    zip
    _7zz
    unzip
    ripgrep
    fd
    bat
    xdragon
    croc
    usbview
    gotop
    gparted

    gcc
    libgcc
    lld
    nix-prefetch-github
    nix-output-monitor
    nh
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
    xwayland
  ];

  fonts.packages = with pkgs; [
    commit-mono
    meslo-lgs-nf
    nerdfonts
  ];

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.11";

  nix.nixPath = [
    "nixpkgs=/home/bryce/dot"
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
