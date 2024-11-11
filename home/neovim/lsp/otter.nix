{
  programs.nixvim = {
    plugins.otter = {
      enable = true;
      settings.handle_leading_whitespace = true;
    };
    # extraConfigLua = ''
    #   require("otter").activate({ "javascript", "python" }, true, true, nil)
    # '';
    keymaps = [
      # TODO: otter needs keymaps
    ];
  };
}
