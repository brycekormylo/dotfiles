{lib, ...}: {
  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
  };

  services.pulseaudio.enable = lib.mkForce false;
}
