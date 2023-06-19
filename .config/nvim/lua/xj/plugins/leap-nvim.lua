return {
  {
    "ggandor/leap.nvim",
    dependencies = {
      "tpope/vim-repeat",
    },
    -- event = "BufReadPost",
    keys = {
      { "gs",  mode = { "n", "x", "o" },   desc = "Leap prefix" },
      { "gs/", "<Plug>(leap-forward-to)",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "gs?", "<Plug>(leap-backward-to)", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gss", "<Plug>(leap-from-window)", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "g/", "<Plug>(leap-forward-to)",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "g?", "<Plug>(leap-backward-to)", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      -- { "<C-j>", "<Plug>(leap-forward-to)",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
      -- { "<C-k>", "<Plug>(leap-backward-to)", mode = { "n", "x", "o" }, desc = "Leap backward to" },
    },
    config = function(_, opts)
      local leap = require "leap"
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
    end,
    opts =
    {
      highlight_unlabeled_phase_one_targets = true,
    }
  },
  {
    "ggandor/flit.nvim",
    -- event = "BufReadPost",
    dependencies = {
      "ggandor/leap.nvim"
    },
    keys = function()
      ---@type LazyKeys[]
      local ret = {}
      for _, key in ipairs { "f", "F", "t", "T" } do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
      end
      return ret
    end,
    opts = {
      labeled_modes = "nv",
      multiline = true,
    },
    -- config = function()
    --   require("flit").setup({
    --     keys = { f = "f", F = "F", t = "t", T = "T" },
    --     labeled_modes = "v",
    --     multiline = true,
    --     opts = {},
    --   })
    -- end,
  }
}
