{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./cmp/autopairs.nix
    ./cmp/cmp.nix
    ./cmp/lspkind.nix
    ./cmp/wilder.nix

    # ./debug/dap.nix

    ./git/diffview.nix
    ./git/gitgraph.nix

    ./lsp/boo.nix
    ./lsp/conform.nix
    ./lsp/fidget.nix
    ./lsp/goto-preview.nix
    # ./lsp/gutentags.nix
    ./lsp/inc-rename.nix
    ./lsp/lint.nix
    ./lsp/lsp.nix
    ./lsp/lsp-endhints.nix
    ./lsp/lsp-signature.nix
    ./lsp/otter.nix
    ./lsp/workspace-diagnostics.nix
    ./lsp/wrapping.nix
    # ./lsp/ufo.nix

    ./motion/flash.nix
    ./motion/hardtime.nix
    ./motion/surround.nix

    ./nav/aerial.nix
    # ./nav/alpha.nix
    # ./nav/grapple.nix
    ./nav/harpoon.nix
    ./nav/oil.nix
    # ./nav/portal.nix
    ./nav/snipe.nix
    ./nav/treesitter.nix
    ./nav/telescope.nix

    ./pilot/encourage.nix
    # ./pilot/reverb.nix

    ./snip/luasnip.nix
    ./snip/undotree.nix

    ./ui/dressing.nix
    ./ui/gitsigns.nix
    ./ui/hlchunk.nix
    ./ui/inline-fold.nix
    ./ui/illuminate.nix
    ./ui/lualine.nix
    ./ui/markview.nix
    ./ui/modicator.nix
    ./ui/mini.nix
    # ./ui/rainbow-delimiters.nix
    ./ui/relative-toggle.nix
    ./ui/satellite.nix
    ./ui/screenkey.nix
    ./ui/tiny-code-action.nix
    ./ui/tiny-inline-diagnostic.nix

    ./utils/comment.nix
    # ./utils/early-retirement.nix
    ./utils/floaterm.nix
    ./utils/icon-picker.nix
    ./utils/kulala.nix
    ./utils/mkdnflow.nix
    # ./utils/obsidian.nix
    ./utils/package-info.nix
    ./utils/pomo.nix
    ./utils/schemastore.nix
    ./utils/tsc.nix
    ./utils/which-key.nix
    # ./utils/molten.nix
    # ./utils/overseer.nix

    ./binds.nix
    ./pkgs.nix
    ./colorscheme.nix
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    luaLoader.enable = true;

    globals = {
      mapleader = " ";

      loaded_netrw = "1"; # Disable default file manager
      loaded_netrwPlugin = "1";

      backupdir = "~/.nvim/backup//";
      directory = "~/.nvim/swap//";
      undodir = "~/.nvim/undo//";
    };

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    diagnostics = {
      virtual_lines = {
        only_current_line = false;
      };
      virtual_text = false;
    };

    opts = {
      mouse = "";
      updatetime = 10;
      number = true;
      relativenumber = true;
      shiftwidth = 4;
      tabstop = 4;
      expandtab = true;
      textwidth = 80;
      linebreak = true;
      wrap = true;
      wrapmargin = 0;
      termguicolors = true;
      autoindent = true;
      smartindent = true;
      scrolloff = 24;
      conceallevel = 2;
      concealcursor = "";
      cursorline = true;
      cursorcolumn = false;
      signcolumn = "yes";
    };

    editorconfig.enable = false;

    extraPlugins = with pkgs.vimPlugins; [
      colorizer
      nvim-web-devicons
      plenary-nvim
      nui-nvim
    ];
  };
}
