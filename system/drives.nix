{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ifuse
    libimobiledevice

    exfat
    gparted
    mount
    ntfs3g
    usbutils
    usbview
  ];

  fileSystems."/home/bryce/media/usb" = {
    device = "/dev/disk/by-uuid/24FD-CF07";
    fsType = "exfat";
    options = [
      "nofail"
      "users"
      "x-gvfs-show"
    ];
  };

  fileSystems."/home/bryce/media/drive" = {
    device = "/dev/disk/by-uuid/2A27-463B";
    fsType = "exfat";
    options = [
      "nofail"
      "users"
      "x-gvfs-show"
    ];
  };
}
