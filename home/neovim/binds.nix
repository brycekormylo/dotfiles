{
  programs.nixvim = {
    plugins.comment = {
      enable = true;
      settings = {
        opleader.line = "<leader>x";
        toggler.line = "<leader>x";
      };
    };

    # General keymaps only
    keymaps = [
      {
        key = "<leader>w";
        action = "<cmd>:wall<cr>";
      }
      {
        key = ":W";
        action = "";
      }
      # {
      #   key = "<leader>q";
      # action = "<cmd>:q<cr>";
      #   action = ":q";
      # }
      {
        key = "<leader>rjt";
        action = "<cmd>require('java').test.run_current_class()<CR>";
        options = {
          desc = "Run Java Test";
        };
      }
      {
        key = "<leader>djt";
        action = "<cmd>require('java').test.debug_current_class()<CR>";
        options = {
          desc = "Debug Java Test";
        };
      }
      {
        mode = ["n" "v"];
        key = "<leader>cf";
        action = "<cmd>lua vim.lsp.buf.format()<cr>";
        options = {
          silent = true;
          desc = "Format";
        };
      }
    ];
  };
}
