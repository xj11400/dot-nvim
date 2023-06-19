return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  keys = {
    { "<localleader>tl", desc = "Toggle lsp line" },
  },
  config = function()
    require("lsp_lines").setup()

    -- Disable virtual_text since it's redundant due to lsp_lines.
    vim.diagnostic.config {
      virtual_text = false,
      -- virtual_lines = {
      --   only_current_line = true,
      -- --   -- highlight_whole_line = false,.
      -- },
    }

    -- hide in default
    require("lsp_lines").toggle()

    -- mapping
    vim.keymap.set("", "<localleader>tl", require("lsp_lines").toggle, { desc = "Toggle LSP Lines" })
  end,
  -- event = "User ZXFile",
}
