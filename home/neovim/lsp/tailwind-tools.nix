{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "tailwind-tools";
        src = pkgs.fetchFromGitHub {
          owner = "luckasranarison";
          repo = "tailwind-tools.nvim";
          rev = "51014920387237ec55193bb64a3b2579b440a63f";
          hash = "sha256-PcN1GSyWVHQxoqm2N/earwOiVebqNdu2XBuF6MfUlyI=";
        };
      })
    ];
    extraConfigLua = ''
      require("tailwind-tools").setup({})
    '';
  };
}
