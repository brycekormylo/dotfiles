{
  programs.nixvim.plugins.noice = {
    enable = true;
    settings = {
      cmdline = {
        enabled = true;
      };
      notify = {
        enabled = false;
      };
      messages = {
        enabled = false; # Adds a padding-bottom to neovim statusline when set to false for some reason
      };
      hover = {
        enabled = false;
      };
      lsp = {
        message = {
          enabled = false;
        };
        progress = {
          enabled = false;
          view = "mini";
        };
        signature = {
          enabled = false;
        };
        hover = {
          enabled = false;
        };
      };
      popupmenu = {
        enabled = false;
        backend = "nui";
      };
      format = {
        filter = {
          pattern = [
            ":%s*%%s*s:%s*"
            ":%s*%%s*s!%s*"
            ":%s*%%s*s/%s*"
            "%s*s:%s*"
            ":%s*s!%s*"
            ":%s*s/%s*"
          ];
          icon = "";
          lang = "regex";
        };
        replace = {
          pattern = [
            ":%s*%%s*s:%w*:%s*"
            ":%s*%%s*s!%w*!%s*"
            ":%s*%%s*s/%w*/%s*"
            "%s*s:%w*:%s*"
            ":%s*s!%w*!%s*"
            ":%s*s/%w*/%s*"
          ];
          icon = "󱞪";
          lang = "regex";
        };
      };
    };
  };
}
