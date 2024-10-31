{config, ...}: {
  programs.nixvim.colorschemes.base16 = {
    enable = true;
    settings = {
      indent-blankline = true;
      telescope_borders = true;
    };
    colorscheme = {
      base00 = "#${config.colorScheme.palette.base00}"; # bg
      base01 = "#${config.colorScheme.palette.base01}"; # bg+
      base02 = "#${config.colorScheme.palette.base02}"; # indent-blankline lowlight
      base03 = "#${config.colorScheme.palette.base03}"; # comments, dead code
      base04 = "#${config.colorScheme.palette.base04}"; # Line Numbers, indent-blankline highlight
      base05 = "#${config.colorScheme.palette.base05}"; # Default Text
      base06 = "#${config.colorScheme.palette.base09}"; # Affects Nothing
      base07 = "#${config.colorScheme.palette.base09}"; # Affects nothing
      base08 = "#${config.colorScheme.palette.base08}"; # lualine git line rm, react function
      base09 = "#${config.colorScheme.palette.base09}"; # values
      base0A = "#${config.colorScheme.palette.base0A}"; # Types + html props
      base0B = "#${config.colorScheme.palette.base0B}"; # strings
      base0C = "#${config.colorScheme.palette.base0C}"; # warnings and htmltags
      base0D = "#${config.colorScheme.palette.base0D}"; # imports & functions & file labels
      base0E = "#${config.colorScheme.palette.base0E}"; # const, function, flow statements
      base0F = "#${config.colorScheme.palette.base0F}"; # delimiter/ nix paths
    };
  };
}
