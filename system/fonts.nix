{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = false;

    packages = with pkgs; [
      material-symbols
      nerd-fonts.symbols-only

      commit-mono
      liberation_ttf
      libertinus
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      roboto
      vista-fonts
    ];

    fontconfig.defaultFonts = {
      serif = ["Libertinus Serif"];
      sansSerif = ["Inter"];
      monospace = ["Commit Mono"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
