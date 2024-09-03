return {
  "stevearc/oil.nvim",
  opts = {
    keymaps = {
      ["q"] = "actions.close",
      ["<BS>"] = "actions.parent",
    },
    view_options = {
      show_hidden = true,
      -- This function defines what is considered a "hidden" file
      is_hidden_file = function(name, bufnr) return vim.startswith(name, ".") end,
      -- This function defines what will never be shown, even when `show_hidden` is set
      is_always_hidden = function(name, bufnr) return vim.startswith(name, ".DS_Store") end,
    },
  },
  enabled = true,
  cmd = "Oil",
  keys = {
    { "<Leader>o", function() require("oil").open_float() end, desc = "Explore with Oil" },
  },
}
