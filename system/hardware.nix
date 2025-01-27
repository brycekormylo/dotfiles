{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc"];
    initrd.kernelModules = [];

    kernelParams = [
      "intel_pstate=disable"
      "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    ];

    kernelPackages = pkgs.linuxKernel.packages.linux_6_1.extend (final: prev: {
      nvidia_x11 = prev.nvidia_x11_legacy390;
    });
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/6c27bd63-e64f-4096-83fc-94b42d4167a0";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/E287-4E3A";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  swapDevices = [];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
