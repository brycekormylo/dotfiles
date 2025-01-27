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

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 12;
      };
      efi.canTouchEfiVariables = true;
    };

    kernelParams = [
      "intel_pstate=disable"
      "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    ];

    kernelPackages = pkgs.linuxKernel.packages.linux_6_1.extend (final: prev: {
      nvidia_x11 = prev.nvidia_x11_legacy390;
    });
  };

  networking = {
    hostName = "pathfinder";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [61458 61459 2416];
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vpl-gpu-rt
        libvdpau-va-gl

        libva-vdpau-driver
        nvidia-vaapi-driver
        libva1
        xrdp
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [intel-vaapi-driver];
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

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    LIBVA_DRIVER_NAME = "iHD";
    # LIBVA_DRIVER_NAME = "nvidia"; # Can't find the driver if i do this
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    sudo.wheelNeedsPassword = false;
  };

  users.users.bryce = {
    isNormalUser = true;
    description = "bryce";
    extraGroups = ["networkmanager" "wheel" "video"];
  };

  services = {
    power-profiles-daemon.enable = false;
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

  systemd.services = {
    "getty@tty1".enable = false; # Autologin
    "autovt@tty1".enable = false;
  };

  environment.systemPackages = with pkgs; [
    firefox
    inkscape
    libreoffice
    librewolf
    neovim
    obsidian
    ungoogled-chromium
    vlc

    ifuse
    libimobiledevice

    bluez
    networkmanagerapplet

    gcc
    libgcc
    lld

    lshw
    nix-output-monitor
    nix-prefetch-github
    nvd

    brightnessctl
    egl-wayland
    gtk3
    hyprcursor
    hyprland
    hyprlang
    libdbusmenu-gtk3
    libnotify
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
