local utils = require "xj.core.utils"
return {
  { import = "xj.lsp.pack.yaml" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "dart")
      end
    end,
  },
  {
    "akinsho/flutter-tools.nvim",
    ft = { "dart" },
    init = function() xj.lsp.skip_setup = utils.list_insert_unique(xj.lsp.skip_setup, "dartls") end,
    opts = {
      lsp = require("xj.core.utils.lsp").config "dartls",
      debugger = {
        enabled = true,
      },
    },
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "jay-babu/mason-nvim-dap.nvim",
        opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "dart") end,
      },
    },
  },
  -- Add "flutter" extension to "telescope"
  { "nvim-telescope/telescope.nvim", opts = function() require("telescope").load_extension "flutter" end },
}
