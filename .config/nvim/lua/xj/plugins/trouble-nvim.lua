return {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  keys = {
    -- { "<leader>x", desc = "Trouble" }, -- set which-key session at lsp.lua
    -- { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Document Diagnostics (Trouble)" },
    { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
    { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
    { "gR", "<cmd>TroubleToggle lsp_references<cr>", desc = "LSP Reference (Trouble)" },
  },
  opts = {
    use_diagnostic_signs = true,
    action_keys = {
      close = { "q", "<esc>" },
      cancel = "<c-e>",
    },
  },
}
