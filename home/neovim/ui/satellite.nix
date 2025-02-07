{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      satellite-nvim
    ];
    extraConfigLua = ''
      require("satellite").setup({
      	width = 1,
      })
    '';
  };
}
