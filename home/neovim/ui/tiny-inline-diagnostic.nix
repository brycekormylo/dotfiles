{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "tiny-inline-diagnostic";
        src = pkgs.fetchFromGitHub {
          owner = "rachartier";
          repo = "tiny-inline-diagnostic.nvim";
          rev = "c0543b2980251a7a2024e936ef724dcdfb07bb87";
          hash = "sha256-UOJf4Oi38Bj8xRHGGV+XWvOlOez6jm908NuThWUQyIU=";
        };
      })
    ];
    extraConfigLua = ''
      require("tiny-inline-diagnostic").setup()
    '';
  };
}
