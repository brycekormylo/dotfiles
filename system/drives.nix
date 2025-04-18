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
    options = [
      "nofail"
      "users"
      "x-gvfs-show"
    ];
  };
}
