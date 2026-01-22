{inputs, ...}: let
  utils = inputs.nixCats.utils;
in {
  imports = [
    inputs.nixCats.homeModule
    ./deps.nix
  ];

  config = {
    nixCats = {
      enable = true;
      addOverlays = [
        (utils.standardPluginOverlay inputs)
      ];
      packageNames = ["nixCats"];

      luaPath = ./.;

      categoryDefinitions.replace = {pkgs, ...}: {
        lspsAndRuntimeDeps = {
          general = with pkgs; [
            dockerfile-language-server
            lazygit
            python3
          ];
          web = with pkgs; [
            biome
            rustywind
            tailwindcss-language-server
            typescript-language-server
            vscode-langservers-extracted
          ];
          lua = with pkgs; [
            lua-language-server
            stylua
          ];
          nix = with pkgs; [
            alejandra
            nixd
          ];
          bash = with pkgs; [
            bash
            bash-language-server
            beautysh
          ];
          markdown = with pkgs; [
            marksman
            markdown-oxide
            yaml-language-server
            yamlfix
          ];
          swift = with pkgs; [
            sourcekit-lsp
          ];
          rust = with pkgs; [
            cargo
            clang
            clippy
          ];
        };

        startupPlugins = {
          general = with pkgs.vimPlugins; [
            nvim-treesitter.withAllGrammars
          ];
        };
      };

      packageDefinitions.replace = {
        nixCats = {pkgs, ...}: {
          settings = {
            suffix-path = true;
            suffix-LD = true;
            wrapRc = true;
            aliases = ["vim" "vi"];
            neovim-unwrapped =
              inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.neovim;
            hosts.python3.enable = true;
            hosts.node.enable = true;
          };
          categories = {
            general = true;
            markdown = true;
            web = true;
            lua = true;
            nix = true;
            bash = true;
            rust = true;
            swift = false;
          };
          extra = {
            nixdExtras.nixpkgs = ''import ${pkgs.path} {}'';
          };
        };
      };
    };
  };
}
