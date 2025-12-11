return {
  "stevearc/oil.nvim",
  opts = {
    keymaps = {
      ["?"] = { "actions.show_help", mode = "n" },
      ["q"] = "actions.close",
      ["<BS>"] = "actions.parent",
    },
    -- columns = {
    --   "icon",
    --   -- "permissions",
    --   -- "size",
    --   -- "mtime",
    -- },
    view_options = {
      show_hidden = true,
      -- This function defines what is considered a "hidden" file
      is_hidden_file = function(name, bufnr) return vim.startswith(name, ".") end,
      -- This function defines what will never be shown, even when `show_hidden` is set
      is_always_hidden = function(name, bufnr) return vim.startswith(name, ".DS_Store") end,
    },
    float = {
      -- Padding around the floating window
      -- padding = 7,
      -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      max_width = 0.9,
      max_height = 0.9,
      border = "rounded",
      -- preview_split: Split direction: "auto", "left", "right", "above", "below".
      -- preview_split = "auto",
    },
  },
  enabled = true,
  cmd = "Oil",
  keys = {
    { "<Leader>o", function() require("oil").open_float() end, desc = "Toggle Oil" },
  },
}
