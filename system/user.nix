{pkgs, ...}: {
  users.users.bryce = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "bryce";
    extraGroups = [
      "input"
      "networkmanager"
      "transmission"
      "video"
      "wheel"
    ];
  };

  systemd.services = {
    "getty@tty1".enable = false; # Autologin
    "autovt@tty1".enable = false;
  };
}
