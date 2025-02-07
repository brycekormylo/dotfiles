{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.ags.homeManagerModules.default
  ];
  # home.packages = with inputs.ags.packages.${pkgs.system}; [
  #   io
  #   notifd
  #   battery
  #   hyprland
  #   network
  #   mpris
  #   wireplumber
  #   tray
  #   powerprofiles
  #   apps
  # ];
  programs = {
    ags = {
      enable = true;
      configDir = ./ags;
      extraPackages = with pkgs; [
        # inputs.ags.packages.${pkgs.system}.battery
        gtksourceview
        webkitgtk_6_0
        accountsservice
      ];
    };
  };
}
