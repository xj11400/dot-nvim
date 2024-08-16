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
        file_ignore_patterns = {
          ".git/.*", -- Exclude the .git directory
          "node_modules/.*", -- Example: Exclude node_modules
          "yarn.lock", -- Exclude yarn.lock files
          "package%-lock.json", -- Exclude package-lock.json (note the escape)
          "lazy%-lock.json", -- Exclude lazy-lock.json (note the escape)
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })
    return opts
  end,
}
