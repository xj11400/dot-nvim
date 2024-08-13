local prefix = "<Localleader>u"
return {
  "xiyaowong/transparent.nvim",
  opts = {
    -- table: default groups
    groups = {
      "Normal",
      "NormalNC",
      "Comment",
      "Constant",
      "Special",
      "Identifier",
      "Statement",
      "PreProc",
      "Type",
      "Underlined",
      "Todo",
      "String",
      "Function",
      "Conditional",
      "Repeat",
      "Operator",
      "Structure",
      "LineNr",
      "NonText",
      "SignColumn",
      "CursorLineNr",
      "EndOfBuffer",
      "NeoTreeNormal",
      "NeoTreeNormalNC",
      "NeoTreeTabActive",
      "NeoTreeTabInactive",
      "NeoTreeTabSeparatorActive",
      "NeoTreeTabSeparatorInactive",
      "StatusLine",
      "CursorColumn",
      "WinBar",
      "WinBarNC",
      "TabLineFill",
      "TabLine",
      "TelescopePreviewNormal",
      "TelescopeResultsNormal",
      "TelescopePromptNormal",
      "FloatBorder",
      -- "WinSeparator",
      -- "NeoTreeWinSeparator",
      -- "NeoTreeTabSeparatorActive",
      -- "NeoTreeTabSeparatorInactive",
    },
    -- table: additional groups that should be cleared
    extra_groups = {
      "NormalFloat",
      "NvimTreeNormal",
    },
    -- table: groups you don't want to clear
    exclude_groups = {},
  },
  keys = {
    { prefix .. "T", "<cmd>TransparentToggle<CR>", desc = "Toggle transparency" },
  },
  lazy = false,
}