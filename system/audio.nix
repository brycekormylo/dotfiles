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
<<<<<<< HEAD
      enable = true;
      pulse.enable = true;
      jack.enable = true;
=======
      enable = false;
      pulse.enable = true;
      # jack.enable = true;
>>>>>>> main
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
  };

<<<<<<< HEAD
  services.pulseaudio.enable = lib.mkForce false;
=======
  services.pulseaudio.enable = lib.mkForce true;
>>>>>>> main
}
