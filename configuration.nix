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

  # time.timeZone = "America/Los_Angeles";
  # i18n.defaultLocale = "en_US.UTF-8";

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 12;
      };
      efi.canTouchEfiVariables = true;
    };
    kernelModules = ["kvm-intel"];
    blacklistedKernelModules = ["nouveau"];
    kernelParams = [
      "intel_pstate=disable"
    ];
  };

  networking = {
    hostName = "pathfinder";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [61458 61459 2416];
  };

  hardware = {
    enableRedistributableFirmware = true;
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-vaapi-driver
        vpl-gpu-rt
        libvdpau-va-gl
      ];
    };

    nvidia = {
      open = false;
      modesetting.enable = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.legacy_390;
      prime = {
        sync.enable = true;
        nvidiaBusId = "PCI:1:0:0";
        intelBusId = "PCI:0:2:0";
      };
    };

    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
  };

  services = {
    displayManager = {
      defaultSession = "hyprland";
      autoLogin.enable = true;
      autoLogin.user = "bryce";
    };
    xserver = {
      enable = true;
      videoDrivers = ["nvidia"];
      autorun = true;
      xkb.layout = "us";
      xkb.variant = "";
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
      desktopManager.gnome.enable = true;
    };
  };

  xdg.portal.enable = true;

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
    powertop.enable = true; #?
  };

  services = {
    system76-scheduler.settings.cfsProfiles.enable = true; #?
    power-profiles-daemon.enable = false;
    thermald.enable = true;
    tlp = {
      enable = true;
      settings = {
        TLP_DEFAULT_MODE = "BAT";
        TLP_PERSISTENT_DEFAULT = 1;
        CPU_SCALING_GOVERNOR_ON_BAT = "performance";
      };
    };
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    LIBVA_DRIVER_NAME = "iHD";
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    sudo.wheelNeedsPassword = false;
  };

  users.users.bryce = {
    isNormalUser = true;
    description = "bryce";
    extraGroups = ["networkmanager" "wheel"];
  };

  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
    blueman.enable = true;
    usbmuxd.enable = true;
    gvfs.enable = true; # Mount, trash, etc
    tumbler.enable = true; # Thumbnails
    # openssh.enable = true;
  };

  programs.steam.enable = true;

  fileSystems."/home/bryce/media/usb" = {
    device = "/dev/disk/by-uuid/24FD-CF07";
    options = [
      "users"
      "nofail"
      "x-gvfs-show"
    ];
  };

  systemd.services = {
    "getty@tty1".enable = false; # Autologin
    "autovt@tty1".enable = false;
  };

  environment.systemPackages = with pkgs; [
    firefox
    librewolf
    obsidian
    ungoogled-chromium
    neovim

    inkscape
    libreoffice
    vlc
    mpv

    libimobiledevice
    ifuse

    bluez
    brightnessctl
    gparted
    libdbusmenu-gtk3
    libnotify
    mount
    networkmanagerapplet
    usbview
    usbutils

    exfat
    exfatprogs
    ntfs3g
    ffmpeg
    ffmpegthumbnailer
    libpng
    lsix
    mediainfo
    ueberzugpp

    libva-vdpau-driver
    nvidia-vaapi-driver
    libva1
    libva-utils

    grim
    slurp
    kooha

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
    liberation_ttf
    nerd-fonts.symbols-only
    vistafonts
  ];

  system.stateVersion = "25.05";

  nixpkgs.config = {
    allowUnfree = true;
    nvidia.acceptLicense = true;
  };

  nix = {
    settings.experimental-features = ["nix-command" "flakes"];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 8d";
    };
    optimise.automatic = true;
    nixPath = [
      "nixpkgs=${inputs.nixpkgs}"
      "nixos-config=${config.users.users.bryce.home}/dot/configuration.nix"
    ];
  };
}
