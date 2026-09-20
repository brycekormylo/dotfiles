{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    pavucontrol
  ];

  services = {
    pipewire = {
      enable = false;
      pulse.enable = true;
      # jack.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
  };

  services.pulseaudio.enable = lib.mkForce true;
}
