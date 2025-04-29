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

  services.xserver.videoDrivers = ["nvidia"];

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-compute-runtime
        intel-media-driver
        intel-ocl
        libvdpau-va-gl
        vpl-gpu-rt
        mesa

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
      # package = config.boot.kernelPackages.nvidiaPackages.legacy_390;
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        nvidiaBusId = "PCI:1:0:0";
        intelBusId = "PCI:0:2:0";
      };
    };
  };

  users.users.bryce = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "bryce";
    extraGroups = [
      "input"
      "networkmanager"
      "transmission"
      "video"
      "wheel"
    ];
  };

  services = {
    thermald.enable = true;
    blueman.enable = true;
    usbmuxd.enable = true;
    gvfs.enable = true; # Mount, trash, etc
    gnome.gnome-keyring.enable = true;
    tumbler.enable = true; # Thumbnails
    # openssh = {
    #   enable = true;
    # };
  };

  powerManagement.cpuFreqGovernor = "performance";

  # Steam wont launch
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  systemd.services = {
    "getty@tty1".enable = false; # Autologin
    "autovt@tty1".enable = false;
  };

  environment.systemPackages = with pkgs; [
    firefox
    floorp
    ungoogled-chromium

    neovim
    vscodium

    libreoffice
    obsidian
    vlc

    bluez
    brightnessctl
    dbus-broker
    libnotify
    networkmanagerapplet
    wireplumber

    gcc
    libgcc

    # Rust needs these sometimes
    # dlib
    # llvmPackages.bintools
    # libxkbcommon

    deadnix
    nix-diff
    nix-output-monitor
    nix-prefetch-github
    nix-tree
    nvd

    util-linux
  ];

  fonts = {
    enableDefaultPackages = false;

    packages = with pkgs; [
      material-symbols
      nerd-fonts.symbols-only

      commit-mono
      liberation_ttf
      libertinus
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      roboto
      vistafonts
    ];

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
    # LIBVA_DRIVER_NAME = "nvidia"; # Can't find the driver if i do this
    VDPAU_DRIVER = "va_gl"; # or "nvidia"
  };

  system.stateVersion = "23.11"; # Do not change

  nixpkgs.config = {
    allowUnfree = true;
    nvidia.acceptLicense = true;
  };

  nix = {
    settings = {
      auto-optimise-store = true;
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
