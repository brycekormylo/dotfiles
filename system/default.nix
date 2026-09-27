{pkgs, ...}: {
  imports = [
    ./audio.nix
    ./avahi.nix
    ./bluetooth.nix
    ./drives.nix
    ./fonts.nix
    ./greetd.nix
    ./hardware.nix
    ./hardware-configuration.nix
    ./ivpn.nix
    # ./jellyfin.nix
    ./locale.nix
    ./networking.nix
    ./niri.nix
    ./nix-conf.nix
    ./nix-ld.nix
    ./power.nix
    ./security.nix
    # ./steam.nix
    ./substituters.nix
    ./thunar.nix
    ./user.nix
    ./utils.nix
    ./zsh.nix
  ];

  services = {
    xserver.videoDrivers = ["amdgpu"];
    libinput.enable = true;
    udisks2.enable = true;
    thermald.enable = true;
    blueman.enable = true;
    usbmuxd.enable = true;
    gvfs.enable = true; # Mount, trash, etc
    gnome.gnome-keyring.enable = true;
    tumbler.enable = true; # Thumbnails
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
    dbus-broker
    libnotify
    nftables
    networkmanagerapplet

    gcc
  ];
}
