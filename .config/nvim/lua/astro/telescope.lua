return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    opts = vim.tbl_deep_extend("force", opts, {
      defaults = {
        mappings = {
          i = {
            -- ["<CR>"] already been setting to customized function open_selected() in AstroNvim
            ["<C-J>"] = opts.defaults.mappings.i["<CR>"],
          },
          n = {
            -- ["<CR>"] already been setting to customized function open_selected() in AstroNvim
            ["<C-J>"] = opts.defaults.mappings.n["<CR>"],
          },
        },
      },
    })
    return opts
  end,
}
