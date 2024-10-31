{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "kulala";
        src = pkgs.fetchFromGitHub {
          owner = "mistweaverco";
          repo = "kulala.nvim";
          rev = "eb03136797d5374b0142b8f7e4438334387fa183";
          hash = "sha256-h6MsNAmpRrRRGMHVzwGWhj4iHobcgsKnc80n26FQ+pk=";
        };
      })
    ];
    extraConfigLua = ''
      require("kulala").setup({})
    '';
  };
}
