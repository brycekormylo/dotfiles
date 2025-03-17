{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
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
  };

  networking = {
    hostName = "pathfinder";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [61458 61459 2416];
  };

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-compute-runtime
        intel-media-driver
        intel-ocl
        libvdpau-va-gl
        vpl-gpu-rt
        mesa.drivers

        # intel-vaapi-driver
        libva-vdpau-driver
        libva1
        nvidia-vaapi-driver
        vaapiVdpau
        xrdp
      ];
      enable32Bit = true;
      extraPackages32 = with pkgs.pkgsi686Linux; [
        intel-vaapi-driver
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

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    dconf.enable = true;
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    sudo.wheelNeedsPassword = false;
  };

  users.users.bryce = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "bryce";
    extraGroups = [
      "input"
      "transmission"
      "networkmanager"
      "wheel"
      "video"
    ];
  };

  services = {
    power-profiles-daemon.enable = false;
    upower.enable = true;
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
    gnome.gnome-keyring.enable = true;
    tumbler.enable = true; # Thumbnails
    # openssh = {
    #   enable = true;
    # };
  };

  # Steam wont launch
  # programs.steam = {
  #   enable = true;
  #   gamescopeSession.enable = true;
  # };

  systemd.services = {
    "getty@tty1".enable = false; # Autologin
    "autovt@tty1".enable = false;
  };

  environment.systemPackages = with pkgs; [
    firefox
    libreoffice
    # librewolf
    neovim
    vscodium
    obsidian
    ungoogled-chromium
    vlc

    bluez
    brightnessctl
    dbus-broker
    libnotify
    networkmanagerapplet
    wireplumber

    gcc
    libgcc
    lld

    lshw
    nix-output-monitor
    nix-prefetch-github
    nvd

    util-linux
    # newt

    egl-wayland
    gtk3
    hyprcursor
    hyprland
    hyprlang
    libdbusmenu-gtk3
    lxappearance
    nwg-look
    rofi-wayland
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

  fonts = {
    packages = with pkgs; [
      commit-mono
      liberation_ttf

      nerd-fonts.symbols-only
      material-symbols

      # Sans(Serif) fonts
      libertinus
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      roboto
      vistafonts
    ];

    enableDefaultPackages = false;

    fontconfig.defaultFonts = {
      serif = ["Libertinus Serif"];
      sansSerif = ["Inter"];
      monospace = ["Commit Mono"];
      emoji = ["Noto Color Emoji"];
    };
  };

  environment.sessionVariables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    LIBVA_DRIVER_NAME = "iHD";
    VDPAU_DRIVER = "va_gl"; # or "nvidia"
    # LIBVA_DRIVER_NAME = "nvidia"; # Can't find the driver if i do this

    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  system.stateVersion = "25.05";

  nixpkgs.config = {
    allowUnfree = true;
    nvidia.acceptLicense = true;
  };

  nix = {
    settings = {
      builders-use-substitutes = true;
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root" "@wheel"];
    };
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
