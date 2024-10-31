{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "snipe";
        src = pkgs.fetchFromGitHub {
          owner = "leath-dub";
          repo = "snipe.nvim";
          rev = "854a47c970413405361487c13e2b1e9aa9a3696e";
          hash = "sha256-DhJ2ss0p64mpaVo9rri72pEoaWbOOL05klM9AydnqJk=";
        };
      })
    ];
    extraConfigLua = ''
      require("snipe").setup({})
    '';
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = ''
          <cmd>lua require("snipe").open_buffer_menu()<cr>
        '';
        options = {
          desc = "Open snipe";
        };
      }
    ];
  };
}
