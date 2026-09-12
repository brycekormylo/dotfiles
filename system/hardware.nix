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
