{
  programs.nixvim = {
    plugins.otter = {
      enable = true;
    };
    extraConfigLua = ''
      require("otter").activate({ "javascript", "python" }, true, true, nil)
    '';
    keymaps = [
      # TODO: otter needs keymaps
    ];
  };
}
