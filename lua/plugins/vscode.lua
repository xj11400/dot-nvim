-- don't do anything in non-vscode instances
if not vim.g.vscode then
  return {}
end

local _zx = require "colors.zx"

-- a list of known working plugins with vscode-neovim, update with your own plugins
local plugins = {
  "lazy.nvim",
  "AstroNvim",
  "astrocore",
  "astroui",
  "Comment.nvim",
  "nvim-autopairs",
  "nvim-treesitter",
  "nvim-ts-autotag",
  "nvim-treesitter-textobjects",
  "nvim-ts-context-commentstring",
  "flash.nvim",
  "comment-box.nvim",
  "mini.surround",
}

local Config = require("lazy.core.config")
-- disable plugin update checking
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
-- replace the default `cond`
Config.options.defaults.cond = function(plugin)
  return vim.tbl_contains(plugins, plugin.name)
end

-- vscode
local vscode = require "vscode"
vim.notify = vscode.notify

---@type LazySpec
return {
  -- add a few keybindings
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = function(_, opts)
      opts = vim.tbl_deep_extend("force", opts, {
        options = {
          opt = {
            cmdheight = 1, -- fix vscode-neovim messages popup
          },
        },
        mappings = {
          n = {
            ["<Localleader>R"] = "<CMD>lua require('vscode').call('workbench.action.reloadWindow')<CR>",
            -- call VSCodeNotify('') -> require('vscode').call('')
            ["<Leader>ff"] = "<CMD>Find<CR>",
            ["<Leader>fw"] = "<CMD>lua require('vscode').call('workbench.action.findInFiles')<CR>",
            ["<Leader>ls"] = "<CMD>lua require('vscode').call('workbench.action.gotoSymbol')<CR>",
            ["<Leader>lf"] = "<CMD>lua require('vscode').call('editor.action.formatDocument.none')<CR>",
          },
        },
      })
      return opts
    end,
  },
  -- disable colorscheme setting
  { "AstroNvim/astroui", opts = { colorscheme = false } },
  -- disable treesitter highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { highlight = { enable = false } },
  },
  -- plugins
  {
    "folke/flash.nvim",
    config = function()
        _zx.set_hl({
          FlashLabel = { fg = _zx.ui.base, bg = _zx.ui.blue, bold = true },
          FlashMatch = { fg = _zx.ui.text, bg = _zx.ui.yellow},
          FlashCurrent = { fg = _zx.ui.text, bg = _zx.ui.yellow},
        })
    end,
  },
}
