return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "jay-babu/mason-nvim-dap.nvim",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")
      package.loaded["mason-nvim-dap.mappings.configurations"] = {}
      local mason_dap = require("mason-nvim-dap")
      local dap_virtual_text = require("nvim-dap-virtual-text")

      -- Setup DAP UI
      ui.setup()
      vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end

      -- Setup Virtual Text
      dap_virtual_text.setup()

      -- Setup Mason DAP
      mason_dap.setup({
        ensure_installed = { "cppdbg", "node2", "python" },
        automatic_installation = true,
        handlers = {
          function(config)
            mason_dap.default_setup(config)
          end,
        },
      })

      -- DAP Configs
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
              return cwd .. "/venv/bin/python"
            elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
              return cwd .. "/.venv/bin/python"
            else
              return "/usr/bin/python"
            end
          end,
        },
      }

      dap.configurations.c = {
        {
          name = "Launch C file",
          type = "cppdbg",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtEntry = false,
          MIMode = "lldb",
        },
        {
          name = "Attach to lldbserver :1234",
          type = "cppdbg",
          request = "launch",
          MIMode = "lldb",
          miDebuggerServerAddress = "localhost:1234",
          miDebuggerPath = "/usr/bin/lldb",
          cwd = "${workspaceFolder}",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
        },
      }
    end,
  },
}
