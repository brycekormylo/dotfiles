{
<<<<<<< HEAD
  pkgs,
=======
>>>>>>> main
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

<<<<<<< HEAD
  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "usb_storage"
    "sd_mod"
    "sdhci_pci"
    "i2c_hid"
    "i2c_hid_acpi"
    "i2c_piix4"
    "i2c_designware_platform"
  ];
  boot.initrd.kernelModules = [
    "amdgpu"
    "i2c_hid_acpi"
    "i2c_designware_platform"
  ];
  boot.extraModulePackages = [];

  boot.kernelModules = [
    "amd_sfh"
    "i2c_designware_platform"
    "i2c_designware_core"
    "i2c_hid_acpi"
  ];

  boot.kernelParams = [
    "mem_sleep_default=deep"
    "rtc_cmos.use_acpi_alarm=1"
    "acpi_enforce_resources=lax"
    "i8042.nopnp"
  ];

  # suspend needs kernel 6.7 or later
  boot.kernelPackages = pkgs.linuxPackages_latest;

  hardware.enableRedistributableFirmware = true;
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/4e135e3b-385b-4c39-ab7c-f1bd7189a0be";
=======
  boot = {
    initrd = {
      systemd.enable = true;
      kernelModules = [
        "nvidia"
        "i915"
        "nvidia_modeset"
        "nvidia_drm"
      ];
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "nvme"
        "usb_storage"
        "sd_mod"
        "rtsx_pci_sdmmc"
      ];
    };
    extraModulePackages = [config.boot.kernelPackages.nvidia_x11];
    blacklistedKernelModules = ["nouveau"];

    kernelParams = [
      "intel_pstate=disable"
      "i915.force_probe=3e94"
      "nvidia_drm.fbdev=1"
      # "nvidia_drm"
      # "nvidia_drm.modeset=1"
      # "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/6c27bd63-e64f-4096-83fc-94b42d4167a0";
>>>>>>> main
    fsType = "ext4";
  };

  fileSystems."/boot" = {
<<<<<<< HEAD
    device = "/dev/disk/by-uuid/068E-B892";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

=======
    device = "/dev/disk/by-uuid/E287-4E3A";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

>>>>>>> main
  swapDevices = [];

  networking.useDHCP = lib.mkDefault true;

<<<<<<< HEAD
  services.fwupd.enable = true;
}
# {
#   pkgs,
#   config,
#   lib,
#   modulesPath,
#   ...
# }: {
#   imports = [
#     (modulesPath + "/installer/scan/not-detected.nix")
#   ];
#
#   # boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "usb_storage" "sd_mod" "sdhci_pci"];
#   boot.initrd.availableKernelModules = [
#     "nvme"
#     "xhci_pci"
#     "usb_storage"
#     "sd_mod"
#     "sdhci_pci"
#     "i2c_hid"
#     "i2c_hid_acpi"
#     "i2c_piix4"
#     "i2c_designware_platform"
#   ];
#   boot.initrd.kernelModules = [
#     "amdgpu"
#     "i2c_hid_acpi"
#     "i2c_designware_platform"
#   ];
#   # boot.kernelModules = ["kvm-amd"];
#   boot.extraModulePackages = [];
#   # boot.blacklistedKernelModules = ["elan_i2c"];
#
#   boot.kernelModules = [
#     "amd_sfh"
#     "i2c_designware_platform"
#     "i2c_designware_core"
#     "i2c_hid_acpi"
#   ];
#
#   boot.kernelParams = [
#     "mem_sleep_default=deep"
#     "rtc_cmos.use_acpi_alarm=1"
#     "acpi_enforce_resources=lax"
#
#     # Correct ACPI path string without leading backslash:
#     "gpiolib_acpi.ignore_interrupt=SYNAC780"
#     "acpi.prefer_microsoft_dsm_guid=1"
#   ];
#
#   boot.extraModprobeConfig = ''
#     options i2c_hid polling_mode=1
#   '';
#
#   # suspend needs kernel 6.7 or later
#   boot.kernelPackages = pkgs.linuxPackages_latest;
#
#   # https://gitlab.freedesktop.org/drm/amd/-/issues/2812#note_2190544
#   hardware.enableRedistributableFirmware = true;
#   hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
#   boot.initrd.prepend = lib.mkOrder 0 [
#     "${pkgs.fetchurl {
#       url = "https://gitlab.freedesktop.org/drm/amd/uploads/9fe228c7aa403b78c61fb1e29b3b35e3/slim7-ssdt";
#       sha256 = "sha256-Ef4QTxdjt33OJEPLAPEChvvSIXx3Wd/10RGvLfG5JUs=";
#       name = "slim7-ssdt";
#     }}"
#   ];
#
#   fileSystems."/" = {
#     device = "/dev/disk/by-uuid/4e135e3b-385b-4c39-ab7c-f1bd7189a0be";
#     fsType = "ext4";
#   };
#
#   fileSystems."/boot" = {
#     device = "/dev/disk/by-uuid/068E-B892";
#     fsType = "vfat";
#     options = ["fmask=0077" "dmask=0077"];
#   };
#
#   nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
#   # hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
#
#   swapDevices = [];
#
#   networking.useDHCP = lib.mkDefault true;
#
#   services.fwupd.enable = true;
# }
=======
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  services.fwupd.enable = true;
}
>>>>>>> main
