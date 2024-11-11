{
  programs.nixvim.plugins.fidget = {
    enable = true;
    logger = {
      level = "error"; # “off”, “error”, “warn”, “info”, “debug”, “trace”
      floatPrecision =
        1.0e-2; # Limit the number of decimals displayed for floats
    };

    progress = {
      pollRate = 30; # How and when to poll for progress messages
      suppressOnInsert = true; # Suppress new messages while in insert mode
      ignoreDoneAlready = true; # Ignore new tasks that are already complete
      ignoreEmptyMessage =
        false; # Ignore new tasks that don't contain a message
      clearOnDetach =
        # Clear notification group when LSP server detaches
        ''
          function(client_id)
            local client = vim.lsp.get_client_by_id(client_id)
            return client and client.name or nil
          end
        '';
      notificationGroup =
        # How to get a progress message's notification group key
        ''
          function(msg) return msg.lsp_client.name end
        '';
      ignore = []; # List of LSP servers to ignore
      lsp = {
        progressRingbufSize =
          50; # Configure the nvim's LSP progress ring buffer size
      };
      display = {
        renderLimit = 8; # How many LSP messages to show at once
        doneTtl = 8; # How long a message should persist after completion
        doneIcon = "✔"; # Icon shown when all LSP progress tasks are complete
        doneStyle = "Constant"; # Highlight group for completed LSP tasks
        progressTtl = "math.huge"; # How long a message should persist when in progress
        progressIcon = {
          pattern = "dots";
          period = 1;
        }; # Icon shown when LSP progress tasks are in progress
        progressStyle = "WarningMsg"; # Highlight group for in-progress LSP tasks
        groupStyle = "Title"; # Highlight group for group name (LSP server name)
        iconStyle = "Question"; # Highlight group for group icons
        priority = 30; # Ordering priority for LSP notification group
        skipHistory =
          true; # Whether progress notifications should be omitted from history
        formatMessage = ''
          require ("fidget.progress.display").default_format_message
        ''; # How to format a progress message
        formatAnnote = ''
          function (msg)
            return msg.title
          end
        ''; # How to format a progress annotation
        formatGroupName = ''
          function (group)
            return tostring (group)
          end
        ''; # How to format a progress notification group's name
        # overrides = {
        #   rust_analyzer = {name = "rust-analyzer";};
        # }; # Override options from the default notification config
      };
    };

    notification = {
      pollRate = 10; # How frequently to update and render notifications
      filter = "info"; # “off”, “error”, “warn”, “info”, “debug”, “trace”
      historySize = 128; # Number of removed messages to retain in history
      overrideVimNotify = true;
      redirect = ''
        function(msg, level, opts)
          if opts and opts.on_open then
            return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
          end
        end
      '';
      configs = {
        default = {
          iconOnLeft = false;
          infoAnnote = "⁝";
          warnAnnote = "";
          errorAnnote = "";
          debugAnnote = "";
        };
      };

      window = {
        normalHl = "Comment";
        winblend = 100;
        border = "solid"; # none, single, double, rounded, solid, shadow
        zindex = 45;
        maxWidth = 100;
        maxHeight = 200;
        xPadding = 3;
        yPadding = 3;
        align = "top";
        relative = "editor";
      };
      view = {
        stackUpwards = false; # Display notification items from bottom to top
        iconSeparator = " "; # Separator between group name and icon
        groupSeparator = "---"; # Separator between notification groups
        groupSeparatorHl = "Comment";
      };
    };
  };
}
