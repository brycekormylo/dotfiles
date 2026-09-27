{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    bluez
  ];

  hardware.bluetooth = {
    enable = true;
  };
}
