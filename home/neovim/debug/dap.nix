{
  programs.nixvim.plugins = {
    dap = {
      enable = true;
      signs = {
        dapBreakpoint = {
          text = "●";
          texthl = "DapBreakpoint";
        };
        dapBreakpointCondition = {
          text = "●";
          texthl = "DapBreakpointCondition";
        };
        dapLogPoint = {
          text = "◆";
          texthl = "DapLogPoint";
        };
      };
      configurations = {
        java = [
          {
            type = "java";
            request = "launch";
            name = "Debug (Attach) - Remote";
            hostName = "127.0.0.1";
            port = 5005;
          }
        ];
      };
    };
  };
}
