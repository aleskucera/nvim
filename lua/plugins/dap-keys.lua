return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>d", desc = "Debugger" },
      {
        "<leader>dt",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>du",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.open()
        end,
        desc = "Open REPL",
      },
      {
        "<leader>dl",
        function()
          require("dap").run_last()
        end,
        desc = "Run Last",
      },
      {
        "<leader>dq",
        function()
          require("dap").terminate()
          require("dapui").close()
          require("nvim-dap-virtual-text").toggle()
        end,
        desc = "Terminate",
      },
      {
        "<leader>db",
        function()
          require("dap").list_breakpoints()
        end,
        desc = "List Breakpoints",
      },
      {
        "<leader>de",
        function()
          require("dap").set_exception_breakpoints({ "all" })
        end,
        desc = "Set Exception Breakpoints",
      },
    },
  },
}
