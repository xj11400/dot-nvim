local options = {}

options = {
  opt = { -- vim.opt.<key>
    clipboard = "", -- don't use "unnamedplus"
    cursorcolumn = true, -- Highlight the text line of the cursor column
    signcolumn = "auto:3", -- Show both gitsign symbols and diagnostics symbols
  },
  g = { -- vim.g.<key>
    -- configure global vim variables (vim.g)
  },
}

return options
