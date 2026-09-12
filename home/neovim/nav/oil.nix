{
  programs.nixvim = {
    plugins.oil = {
      enable = true;
      settings = {
        default_file_explorer = true;
        delete_to_trash = true;
        skip_confirm_for_simple_edits = true;
        lsp_file_method.autosave_changes = true;
        columns = [
          "icon"
        ];
        view_options = {
          show_hidden = true;
          natural_order = true;
        };
        float = {
          padding = 2;
          max_width = 72;
        };
        win_options = {
          wrap = true;
        };
        keymaps = {
          "<C-c>" = "actions.parent";
          "-" = "actions.close";
          "<C-h>" = "actions.select_split";
          "<C-l>" = "actions.refresh";
          "<C-p>" = "actions.preview";
          "<C-s>" = "actions.select_vsplit";
          "<C-t>" = "actions.select_tab";
          "<CR>" = "actions.select";
          "_" = "actions.open_cwd";
          "`" = "actions.cd";
          "g." = "actions.toggle_hidden";
          "g?" = "actions.show_help";
          "g\\" = "actions.toggle_trash";
          "gs" = "actions.change_sort";
          "gx" = "actions.open_external";
          "~" = "actions.tcd";
        };
      };
    };
    keymaps = [
      {
        mode = ["n" "v"];
        key = "-";
        action = "<cmd>:Oil --float<cr>";
        options = {
          desc = "Open parent directory";
        };
      }
      {
        mode = ["n" "v"];
        key = "<leader>-";
        action = "<cmd>:Oil --float<cr>";
        options = {desc = "Open parent directory";};
      }
    ];
  };
}
