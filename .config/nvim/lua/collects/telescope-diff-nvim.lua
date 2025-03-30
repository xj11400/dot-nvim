return {
  "jemag/telescope-diff.nvim",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
  },
  keys = {
    {
      "<Leader>fd",
      desc = "Diff",
    },
    {
      "<Leader>fdf",
      function() require("telescope").extensions.diff.diff_files { hidden = true } end,
      desc = "Compare files",
    },
    {
      "<Leader>fdd",
      function() require("telescope").extensions.diff.diff_current { hidden = true } end,
      desc = "Compare file with current",
    },
  },
}
