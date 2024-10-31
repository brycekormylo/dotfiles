{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "wrapping";
        src = pkgs.fetchFromGitHub {
          owner = "andrewferrier";
          repo = "wrapping.nvim";
          rev = "3a823200c297885b70515fa8d974e1763c578e26";
          hash = "sha256-tsjeOLc8cxeZ8uTMY9sqsAZNAji8QJ8M9/TIez8ZM+s=";
        };
      })
    ];
    extraConfigLua = ''
      require("wrapping").setup({})
    '';
  };
}
