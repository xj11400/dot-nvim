return {
  "lambdalisue/vim-suda",
  config = function()
    vim.g.suda_smart_edit = 1

    -- mapping
    vim.keymap.set({ "n", "v" }, "<Localleader>W", ":SudaWrite<CR>", { desc = "Force Write" })
  end,
}
