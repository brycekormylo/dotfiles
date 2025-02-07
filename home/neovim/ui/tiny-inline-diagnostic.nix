{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      tiny-inline-diagnostic-nvim
    ];
    extraConfigLua = ''
      require("tiny-inline-diagnostic").setup()
    '';
  };
}
