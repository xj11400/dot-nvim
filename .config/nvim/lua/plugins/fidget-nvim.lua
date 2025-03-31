return {
  "j-hui/fidget.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    return vim.tbl_deep_extend("force", opts, {
      progress = {
        display = {
          render_limit = 2,
        },
      },
    })
  end,
}
