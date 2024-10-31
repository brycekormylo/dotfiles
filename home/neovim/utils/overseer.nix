{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "overseer";
        src = pkgs.fetchFromGitHub {
          owner = "dmmulroy";
          repo = "overseer.nvim";
          rev = "236e60cdac6410dd95ea5cecafdb801a304d6a41";
          hash = "sha256-czZWidu+7UUtEt3ofsOAH0+Yv8dVrt0rLNUFWEzcrrM=";
        };
      })
    ];
    extraConfigLua = ''
      require("overseer").setup({})
    '';
  };
}
