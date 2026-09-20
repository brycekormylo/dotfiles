{pkgs, ...}: let
  tiny-glimmer = pkgs.vimUtils.buildVimPlugin {
    name = "tiny-glimmer";
    src = pkgs.fetchFromGitHub {
      owner = "rachartier";
      repo = "tiny-glimmer.nvim";
      rev = "5eaa3eef61e12d7bda9a69aa4467451657d76945";
      hash = "sha256-f17h0ixGBU5qtn2ioB+kmHMqvfZF1ubMfTU1uqgHZSA=";
    };
  };
in {
  programs.nixvim = {
    extraPlugins = [
      (tiny-glimmer.overrideAttrs {
        nvimSkipModule = "test";
      })
    ];
    extraConfigLua = ''
      require("tiny-glimmer").setup({
        enabled = true,
        disable_warnings = false,
        default_animation = "bounce",

        animations = {
          bounce = {
            max_duration = 500,
            min_duration = 300,
            oscillation_count = 2,
            from_color = "#32302f",
            to_color = "#72837c",
          },
        },

        overwrite = {
          auto_map = true,
          yank = {
            enabled = true,
            default_animation = "bounce",
          },
          search = {
            enabled = true,
            default_animation = "bounce",
          },
          paste = {
            enabled = false,
            default_animation = "bounce",
          },
          undo = {
            enabled = true,
            default_animation = "bounce",
          },
          redo = {
            enabled = true,
            default_animation = "bounce",
          },
        },
      })
    '';
  };
}
