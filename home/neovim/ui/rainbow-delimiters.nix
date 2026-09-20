{
  programs.nixvim = {
    plugins.rainbow-delimiters = {
      enable = true;
      highlight = [
        "RainbowDelimiterRed"
        "RainbowDelimiterYellow"
        "RainbowDelimiterBlue"
        "RainbowDelimiterOrange"
        "RainbowDelimiterGreen"
        "RainbowDelimiterViolet"
        "RainbowDelimiterCyan"
      ];
    };
    extraConfigLua = ''
      vim.cmd([[
        highlight link RainbowDelimiterRed MoreMsg
        highlight link RainbowDelimiterYellow SpecialChar
        highlight link RainbowDelimiterBlue Normal
        highlight link RainbowDelimiterOrange Normal
        highlight link RainbowDelimiterGreen Normal
        highlight link RainbowDelimiterViolet Normal
        highlight link RainbowDelimiterCyan Normal
      ]])
    '';
  };
}
