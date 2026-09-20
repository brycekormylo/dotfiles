{
  programs.nixvim = {
    plugins.which-key = {
      enable = true;
      settings.delay = 500;
    };
    extraConfigLua = ''
      require("which-key").setup({
          triggers_blacklist = {
                  n = { "d", "y" }
          }
      })
    '';
  };
}
