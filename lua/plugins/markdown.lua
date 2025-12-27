return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      -- highlights
      local _zx = require "colors.zx"

      vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { fg = _zx.ui.blue, bg = _zx.none })
      vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { fg = _zx.ui.blue, bg = _zx.none })
      vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { fg = _zx.ui.blue, bg = _zx.none })
      vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { fg = _zx.ui.blue, bg = _zx.none })
      vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { fg = _zx.ui.blue, bg = _zx.none })
      vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { fg = _zx.ui.blue, bg = _zx.none })

      require("render-markdown").setup {
        heading = {
          render_modes = true,
          icons = { "󰉫 ", "󰉬 ", "󰉭 ", "󰉮 ", "󰉯 ", "󰉰 " },
        },
        bullet = {
          enabled = false,
        },
        -- checkbox = {
        --   enabled = false,
        -- },
        -- win_options = { concealcursor = { rendered = "nvc" } },
        completions = {
          blink = { enabled = true },
          lsp = { enabled = true },
        },
      }
    end,
  },
}
