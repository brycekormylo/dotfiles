{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "inline-fold";
        src = pkgs.fetchFromGitHub {
          owner = "malbertzard";
          repo = "inline-fold.nvim";
          rev = "d0a24dd55c2fe9477e2636a589499fb7d530e9a";
          hash = "sha256-o07a6PA2IatlbJo7LroADybpfN1PsFVTamyRz94eZdA=";
        };
      })
    ];
    extraConfigLua = ''
      require("inline-fold").setup({
      	opts = {
      		defaultPlaceholder = "…",
      		queries = {

      			tsx = {

      				{ pattern = 'className="([^"]*)"', placeholder = "@" }, -- classes in html
      				{ pattern = 'href="(.-)"' }, -- hrefs in html
      				{ pattern = 'src="(.-)"' }, -- HTML img src attribute
      			},
      			-- Some examples you can use
      			html = {
      				{ pattern = 'class="([^"]*)"', placeholder = "@" }, -- classes in html
      				{ pattern = 'href="(.-)"' }, -- hrefs in html
      				{ pattern = 'src="(.-)"' }, -- HTML img src attribute
      			},
      		},
      	},
      })
    
'';
  };
}
