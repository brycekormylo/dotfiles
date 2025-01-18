{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "tiny-glimmer";
        src = pkgs.fetchFromGitHub {
          owner = "rachartier";
          repo = "tiny-glimmer.nvim";
          rev = "5db30587b4998bcedd69d31488be0046c97698aa";
          hash = "sha256-/3hVp5LsbkmP0eNXkBj9fJ2Fd/MrhxmHYhQ6GngvAiU=";
        };
      })
    ];
    extraConfigLua = ''
      require("tiny-glimmer").setup({
        enabled = true,
        default_animation = "bounce",
        animations = {
          bounce = {
            max_duration = 500,
            min_duration = 300,
            oscillation_count = 1,
            from_color = "#32302f",
            to_color = "#72837c",
          },
        },
      })
    '';
  };
}
