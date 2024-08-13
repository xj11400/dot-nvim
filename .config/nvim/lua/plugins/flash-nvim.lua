return {
  "folke/flash.nvim",
  vscode = true,
  opts = {
    modes = {
      char = {
        -- enabled = false,
        jump_labels = true,
        autohide = true,
        highlight = { backdrop = false },
        -- multi_line = false,
      },
    },
  },
  keys = {
    {
      "gss",
      mode = { "n", "x", "o" },
      function() require("flash").jump() end,
      desc = "Flash",
    },
    {
      "gsS",
      mode = { "n", "o", "x" },
      function() require("flash").treesitter() end,
      desc = "Flash Treesitter",
    },
    {
      "gsr",
      mode = { "n", "o", "x" },
      function() require("flash").remote() end,
      desc = "Remote Flash",
    },
    {
      "gsR",
      mode = { "n", "o", "x" },
      function() require("flash").treesitter_search() end,
      desc = "Treesitter Search",
    },
    {
      "gsl",
      mode = { "n", "o", "x" },
      function()
        require("flash").jump {
          search = { mode = "search", max_length = 0 },
          label = { after = { 0, 0 } },
          pattern = "^",
        }
      end,
      desc = "Jump Line",
    },
    {
      "f",
      mode = { "n", "o", "x" },
      desc = "Forward Find Char",
    },
    {
      "F",
      mode = { "n", "o", "x" },
      desc = "Backward Find Char",
    },
    {
      "t",
      mode = { "n", "o", "x" },
      desc = "Forward Jump Befor",
    },
    {
      "T",
      mode = { "n", "o", "x" },
      desc = "Backward Jump Befor",
    },
    {
      "?",
      mode = { "n", "o", "x" },
      desc = "Forward Search",
    },
    {
      "/",
      mode = { "n", "o", "x" },
      desc = "Forward Search",
    },
  },
}
