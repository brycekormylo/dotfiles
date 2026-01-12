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
            lazygit
            dockerfile-language-server
            python3
            # zig
            # gradle
            # zulu
          ];
          web = with pkgs; [
            vscode-langservers-extracted
            typescript-language-server
            tailwindcss-language-server
            rustywind
            biome
            # nodePackages.jsonlint
          ];
          lua = with pkgs; [
            lua-language-server
            stylua
          ];
          nix = with pkgs; [
            nixd
            alejandra
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
            clang
            cargo
            clippy
          ];
        };

        startupPlugins = {
          general = with pkgs.vimPlugins; [
            # lze
            # lzextras
            # snacks-nvim
            # gruvbox-nvim
            # nvim-web-devicons
            # vim-sleuth
            # plenary-nvim
            # oil-nvim
            # nui-nvim
          ];
        };

        optionalPlugins = {
          lua = with pkgs.vimPlugins; [
            # lazydev-nvim
          ];
          general = with pkgs.vimPlugins; [
            # cmp-nvim-lsp
            # nvim-cmp
            # blink-cmp

            # wilder-nvim
            # conform-nvim
            # luasnip
            # nvim-lint
            # nvim-lspconfig
            # nvim-treesitter-textobjects
            nvim-treesitter.withAllGrammars
            # otter-nvim

            # fidget-nvim

            # lualine-lsp-progress
            # lualine-nvim

            nvim-dap
            nvim-dap-ui
            nvim-dap-virtual-text

            # nvim-comment
            # nvim-surround
            # inc-rename-nvim

            # gitsigns-nvim
            # mini-nvim
            # package-info-nvim
            # smear-cursor-nvim
            # dressing-nvim
            # nvim-colorizer-lua
            # modicator-nvim
            # satellite-nvim
            # tiny-inline-diagnostic-nvim
            # hlchunk-nvim
            # relative-toggle-nvim
            # screenkey-nvim
            # nvim-lsp-endhints
            # (tiny-glimmer.overrideAttrs {
            #   nvimSkipModule = "test";
            # })

            # mkdnflow-nvim
            # markview-nvim

            # grapple-nvim

            # telescope-nvim
            # telescope-fzf-native-nvim
            # telescope-ui-select-nvim
            # fzf-lua

            # hmts-nvim
            # nvim-ts-autotag
            # nvim-treesitter-textobjects
            # nvim-treesitter-refactor
            # nvim-treesitter-context

            # diffview-nvim
            # lazygit-nvim
            # gitgraph-nvim

            # aerial-nvim
            # vim-startuptime
            # which-key-nvim
            # icon-picker-nvim

            # encourage-nvim
            # reverb-nvim
          ];
          unpackaged = [
          ];
        };

        sharedLibraries = {
          general = with pkgs; [];
        };

        environmentVariables = {
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
            unpackaged = true;
          };
          extra = {
            nixdExtras.nixpkgs = ''import ${pkgs.path} {}'';
          };
        };
      };
    };
  };
}
