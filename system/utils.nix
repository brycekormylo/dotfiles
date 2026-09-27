{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # ladybird
    ungoogled-chromium

    # vscodium

    obsidian
    vlc
    # libreoffice
  ];
}
