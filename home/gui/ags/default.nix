{pkgs, ...}: {
  programs = {
    ags = {
      enable = true;
      configDir = ./ags;
      extraPackages = with pkgs; [gtksourceview webkitgtk_6_0 accountsservice];
    };
  };
}
