{
  pkgs,
  inputs,
  ...
}: {
  programs.floorp = {
    enable = true;
    profiles.bryce = {
      search = {
        default = "DuckDuckGo";
        force = true;
        engines = {
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
          "NixOS Wiki" = {
            urls = [{template = "https://wiki.nixos.org/index.php?search={searchTerms}";}];
            iconUpdateURL = "https://wiki.nixos.org/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = ["@nw"];
          };
        };
      };

      # To find extension names run
      # $ nix flake show "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons"
      extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
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
