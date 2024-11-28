{
  programs.nixvim = {
    plugins.dressing = {
      enable = true;
    };
    extraConfigLua = ''
      require("dressing").setup({
      	input = {
      		override = function(conf)
      			conf.col = -1
      			conf.row = 0
      			return conf
      		end,
      	},
      })
    '';
  };
}
