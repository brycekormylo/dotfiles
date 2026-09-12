{
  pkgs,
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

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
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/068E-B892";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  swapDevices = [];

  networking.useDHCP = lib.mkDefault true;

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
