{
  pkgs,
  inputs,
  ...
}: let
  utils = inputs.nixCats.utils;
  # nvim-lsp-endhints = pkgs.vimUtils.buildVimPlugin {
  #   name = "nvim-lsp-endhints";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "chrisgrieser";
  #     repo = "nvim-lsp-endhints";
  #     rev = "a449f2f27b6b985ff216964572224ce432d94a86";
  #     hash = "sha256-kw7tX/bkzm68WcB/VB1tcRNiNKjEYsVboiUzowagId4=";
  #   };
  # };
  # tiny-glimmer = pkgs.vimUtils.buildVimPlugin {
  #   name = "tiny-glimmer";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "rachartier";
  #     repo = "tiny-glimmer.nvim";
  #     rev = "5eaa3eef61e12d7bda9a69aa4467451657d76945";
  #     hash = "sha256-f17h0ixGBU5qtn2ioB+kmHMqvfZF1ubMfTU1uqgHZSA=";
  #   };
  # };
  # screenkey-nvim = pkgs.vimUtils.buildVimPlugin {
  #   name = "screenkey";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "NStefan002";
  #     repo = "screenkey.nvim";
  #     rev = "fea221f005662f43ebf72d9a23c3f75aa8fdf30b";
  #     hash = "sha256-aZ6wT72kjvRUwh7BUB7KZj7A0/E3WyHPNi0YAzDwKGU=";
  #   };
  # };
  # relative-toggle-nvim = pkgs.vimUtils.buildVimPlugin {
  #   name = "relative-toggle";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "cpea2506";
  #     repo = "relative-toggle.nvim";
  #     rev = "fabe2f60f5f148f2bf1fb76e8a542f5adf8d996a";
  #     hash = "sha256-eYBmlVpyP41Dt0qbRWTQPTCpsaIpGT73xHQmgzqD9pI=";
  #   };
  # };
  # icon-picker-nvim = pkgs.vimUtils.buildVimPlugin {
  #   name = "icon-picker";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "ziontee113";
  #     repo = "icon-picker.nvim";
  #     rev = "3ee9a0ea9feeef08ae35e40c8be6a2fa2c20f2d3";
  #     hash = "sha256-VZKsVeSmPR3AA8267Mtd5sSTZl2CAqnbgqceCptgp4w=";
  #   };
  # };
  # encourage-nvim = pkgs.vimUtils.buildVimPlugin {
  #   name = "encourage";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "r-cha";
  #     repo = "encourage.nvim";
  #     rev = "acca5a06dece315d2944d7a1ce07ffecc1901a83";
  #     hash = "sha256-1QDMATZkPTUzYnifAdF9X5bixj9nMOD6PnOg26woRfc=";
  #   };
  # };
  # reverb-nvim = pkgs.vimUtils.buildVimPlugin {
  #   name = "reverb";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "whleucka";
  #     repo = "reverb.nvim";
  #     rev = "76b3a66f629e57b10a6af50f34963b836a99e7ac";
  #     hash = "sha256-OPsWjIZQA6erVgVQrqoNhT7MBkCY8dAyb5HfERBTNZ0=";
  #   };
  # };
  # gitgraph-nvim = pkgs.vimUtils.buildVimPlugin {
  #   name = "gitgraph";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "isakbm";
  #     repo = "gitgraph.nvim";
  #     rev = "01e466b32c346a165135dd47d42f1244eca06572";
  #     hash = "sha256-d55IRrOhK5tSLo2boSuMhDbkerqij5AHgNDkwtGadyI=";
  #   };
  # };
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

      categoryDefinitions.replace = {pkgs, ...} @ packageDef: {
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
