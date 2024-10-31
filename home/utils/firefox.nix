{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles.bryce = {
      search.engines = {
        "Nix Packages" = {
          urls = [
            {
              template = "https://search.nixos.org/packages";
              params = [
                {
                  name = "type";
                  value = "packages";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = ["@np"];
        };
      };
      search.force = true;

      # To find extension names run
      # $ nix flake show "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons"
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        darkreader
        duckduckgo-privacy-essentials
        # enhancer-for-youtube
        firefox-color
        gruvbox-dark-theme
        h264ify
        istilldontcareaboutcookies
        react-devtools
        sponsorblock
        ublock-origin
        vimium
        youtube-shorts-block
      ];
    };
  };
}
