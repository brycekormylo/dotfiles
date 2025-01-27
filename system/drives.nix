{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    exfat
    exfatprogs
    gparted
    mount
    ntfs3g
    usbutils
    usbview
  ];

  fileSystems."/home/bryce/media/usb" = {
    device = "/dev/disk/by-uuid/24FD-CF07";
    options = [
      "users"
      "nofail"
      "x-gvfs-show"
    ];
  };
}
