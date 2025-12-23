return {
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      local dap = require "dap"

      dap.adapters.codelldb = {
        type = "executable",
        command = "codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"
      }

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file") end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      dap.configurations.c = dap.configurations.cpp

      dap.configurations.rust = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file") end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
      return opts
    end,
  },
}
