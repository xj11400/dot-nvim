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
        -- configure to use ripgrep
        vimgrep_arguments = {
          "rg",
          "--follow", -- Follow symbolic links
          "--hidden", -- Search for hidden files
          "--no-heading", -- Don't group matches by each file
          "--with-filename", -- Print the file path with the matched lines
          "--line-number", -- Show line numbers
          "--column", -- Show column numbers
          "--smart-case", -- Smart case search

          -- Exclude some patterns from search
          -- "--glob=!**/.git/*",
          -- "--glob=!**/.idea/*",
          -- "--glob=!**/.vscode/*",
          -- "--glob=!**/build/*",
          -- "--glob=!**/dist/*",
          -- "--glob=!**/yarn.lock",
          -- "--glob=!**/package-lock.json",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        -- needed to exclude some files & dirs from general search
        -- when not included or specified in .gitignore
        -- find_command = {
        --   "rg",
        --   "--files",
        --   "--hidden",
        --   "--glob=!**/.git/*",
        --   "--glob=!**/.idea/*",
        --   "--glob=!**/.vscode/*",
        --   "--glob=!**/build/*",
        --   "--glob=!**/dist/*",
        --   "--glob=!**/yarn.lock",
        --   "--glob=!**/package-lock.json",
        -- },
      },
    })
    return opts
  end,
}
