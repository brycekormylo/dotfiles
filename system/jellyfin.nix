{pkgs, ...}: {
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "pathfinder";
  };

  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
    pkgs.jellyfin-media-player
  ];
}
