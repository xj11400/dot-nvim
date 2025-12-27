local options = {}

options = {
  opt = { -- vim.opt.<key>
    clipboard = "", -- don't use "unnamedplus"
    cursorcolumn = true, -- Highlight the text line of the cursor column
    signcolumn = "yes:2", -- Show both gitsign symbols and diagnostics symbols -- (auto:3)
  },
  g = { -- vim.g.<key>
    -- configure global vim variables (vim.g)
    -- clipboard = {
    --   name = "OSC 52",
    --   copy = {
    --     ["+"] = require("vim.ui.clipboard.osc52").copy "+",
    --     ["*"] = require("vim.ui.clipboard.osc52").copy "*",
    --   },
    --   paste = {
    --     ["+"] = require("vim.ui.clipboard.osc52").paste "+",
    --     ["*"] = require("vim.ui.clipboard.osc52").paste "*",
    --   },
    -- },
  },
}

return options
