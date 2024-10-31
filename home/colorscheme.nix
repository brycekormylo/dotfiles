{nix-colors, ...}: {
  colorScheme = {
    slug = "tempest";
    name = "Tempest";
    author = "Bryce Kormylo";
    palette = {
      base00 = "#32302f"; # bg
      base01 = "#3c3836"; # bg+
      base02 = "#504945"; # --
      base03 = "#665c54"; # comments
      base04 = "#667570"; # Line Numbers
      base05 = "#fbf1c7"; # Default Text
      base06 = "#d5c4a1"; # Affects Nothing
      base07 = "#ebdbb2"; # Affects nothing
      base08 = "#c2e7d5"; # lualine git line remove, react function names
      base09 = "#FDAB5E"; # values
      base0A = "#92b6ab"; # Types
      base0B = "#bdae93"; # strings
      base0C = "#b7d0b5"; # warnings and htmltags
      base0D = "#8BBB94"; # imports & functions & file labels
      base0E = "#8ec6b2"; # const, function, flow statements
      base0F = "#d5c4a1"; # delimiter/ nix paths
    };
  };
  # colorScheme = nix-colors.colorschemes.gruvbox-dark-soft;
}
