-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = function(_, opts)
    local astro = require "astrocore"
    local get_icon = require("astroui").get_icon

    local replace_key = function(mode, key)
      local maps = assert(opts.mappings)
      local tmp = vim.tbl_get(maps, mode)[key]
      vim.tbl_get(maps, mode)[key] = false
      return tmp
    end

    local get_key = function(mode, key)
      local maps = assert(opts.mappings)
      local tmp = vim.tbl_get(maps, mode)[key]
      return tmp
    end

    opts = vim.tbl_deep_extend("force", opts, {
      -- Configure core features of AstroNvim
      features = {
        -- autopairs = true, -- enable or disable autopairs on start
        -- cmp = true, -- enable or disable cmp on start
        -- diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = off)
        -- highlighturl = true, -- enable or disable highlighting of urls on start
        -- -- table for defining the size of the max file for all features, above these limits we disable features like treesitter.
        -- large_buf = { size = 1024 * 100, lines = 10000 },
        -- notifications = true, -- enable or disable notifications on start
      },
      -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
      diagnostics = {
        update_in_insert = false,
        virtual_text = false, -- disable diagnostics virtual text
      },
      -- vim options can be configured here
      options = {
        opt = { -- vim.opt.<key>
        },
        g = { -- vim.g.<key>
          -- configure global vim variables (vim.g)
          -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
          -- This can be found in the `lua/lazy_setup.lua` file
        },
      },
      -- Mappings can be configured through AstroCore as well.
      -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
      mappings = {
        v = {},
        i = {},
        c = {},
        t = {
          -- toggleterm
          ["<Localleader>`"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
          ["<Localleader><esc>"] = { "<C-\\><C-n>", desc = "Toggle terminal visual" },

          -- disable to restore key functions, it has been mapping in AstroCore
          ["<C-H>"] = false,
          ["<C-J>"] = false,
          ["<C-K>"] = false,
          ["<C-L>"] = false,
        },
        n = {
          -- toggleterm
          ["<Localleader>`"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },

          -- heirline
          ['<Leader>b"'] = {
            function()
              require("astroui.status.heirline").buffer_picker(function(bufnr)
                vim.cmd.split()
                vim.api.nvim_win_set_buf(0, bufnr)
              end)
            end,
            desc = "Horizontal split buffer from tabline",
          },
          ["<Leader>b%"] = {
            function()
              require("astroui.status.heirline").buffer_picker(function(bufnr)
                vim.cmd.vsplit()
                vim.api.nvim_win_set_buf(0, bufnr)
              end)
            end,
            desc = "Vertical split buffer from tabline",
          },

          --
          -- mapping to Localleader
          --
          ["<Leader>q"] = { "<Cmd>q<CR>", desc = "Quit" },
          ["<Localleader>q"] = { "<Cmd>confirm q<CR>", desc = "Quit" },
          ["<Localleader>Q"] = { "<Cmd>confirm qall<CR>", desc = "Exit" },
          ["<Localleader>w"] = replace_key("n", "<Leader>w"),
          ["<Localleader>n"] = replace_key("n", "<Leader>n"),
          ["<Localleader>R"] = { function() require("astrocore").reload() end, desc = "Reload" },
          ["<Localleader>t"] = { desc = "Tab" },
          ["<Localleader>tn"] = { "<Cmd>tabnew<CR>", desc = "New Tab" },
          ["<Localleader>tc"] = { "<Cmd>tabclose<CR>", desc = "Close Tab" },
          ["<Localleader>ts"] = { "<Cmd>tab split<CR>", desc = "Split Tab" },

          -- alpha
          ["<Localleader>h"] = replace_key("n", "<Leader>h"),

          -- Plugin Manager
          ["<Localleader>p"] = replace_key("n", "<Leader>p"),
          ["<Localleader>pa"] = replace_key("n", "<Leader>pa"),
          ["<Localleader>pi"] = replace_key("n", "<Leader>pi"),
          ["<Localleader>ps"] = replace_key("n", "<Leader>ps"),
          ["<Localleader>pS"] = replace_key("n", "<Leader>pS"),
          ["<Localleader>pu"] = replace_key("n", "<Leader>pu"),
          ["<Localleader>pU"] = replace_key("n", "<Leader>pU"),
          ["<Localleader>pm"] = replace_key("n", "<Leader>pm"),
          ["<Localleader>pM"] = replace_key("n", "<Leader>pM"),

          -- Session
          ["<Localleader>s"] = replace_key("n", "<Leader>S"),
          ["<Localleader>sl"] = replace_key("n", "<Leader>Sl"),
          ["<Localleader>ss"] = replace_key("n", "<Leader>Ss"),
          ["<Localleader>sS"] = replace_key("n", "<Leader>SS"),
          ["<Localleader>st"] = replace_key("n", "<Leader>St"),
          ["<Localleader>sd"] = replace_key("n", "<Leader>Sd"),
          ["<Localleader>sD"] = replace_key("n", "<Leader>SD"),
          ["<Localleader>sf"] = replace_key("n", "<Leader>Sf"),
          ["<Localleader>sF"] = replace_key("n", "<Leader>SF"),
          ["<Localleader>s."] = replace_key("n", "<Leader>S."),

          -- UI/UX
          ["<Localleader>u"] = get_key("n", "<Leader>u"),
          ["<Localleader>uA"] = replace_key("n", "<Leader>uA"),
          ["<Localleader>ub"] = replace_key("n", "<Leader>ub"),
          ["<Localleader>ud"] = replace_key("n", "<Leader>ud"),
          ["<Localleader>ug"] = replace_key("n", "<Leader>ug"),
          ["<Localleader>u>"] = replace_key("n", "<Leader>u>"),
          ["<Localleader>ui"] = replace_key("n", "<Leader>ui"),
          ["<Localleader>ul"] = replace_key("n", "<Leader>ul"),
          ["<Localleader>un"] = replace_key("n", "<Leader>un"),
          ["<Localleader>uN"] = replace_key("n", "<Leader>uN"),
          ["<Localleader>up"] = replace_key("n", "<Leader>up"),
          ["<Localleader>us"] = replace_key("n", "<Leader>us"),
          ["<Localleader>uS"] = replace_key("n", "<Leader>uS"),
          ["<Localleader>ut"] = replace_key("n", "<Leader>ut"),
          ["<Localleader>uu"] = replace_key("n", "<Leader>uu"),
          ["<Localleader>uw"] = replace_key("n", "<Leader>uw"),
          ["<Localleader>uy"] = replace_key("n", "<Leader>uy"),
          ["<Localleader>uv"] = replace_key("n", "<Leader>uv"),
          ["<Localleader>uV"] = replace_key("n", "<Leader>uV"),
          ["<Localleader>uZ"] = replace_key("n", "<Leader>uZ"),

          -- autopairs
          ["<Localleader>ua"] = replace_key("n", "<Leader>ua"),
          -- notify
          ["<Localleader>uD"] = replace_key("n", "<Leader>uD"),
          -- indent-blankline
          ["<Localleader>u|"] = replace_key("n", "<Leader>u|"),
          -- colorizer
          ["<Localleader>uz"] = replace_key("n", "<Leader>uz"),
          -- cmp_lunasnip
          ["<Localleader>uc"] = replace_key("n", "<Leader>uc"),
          ["<Localleader>uC"] = replace_key("n", "<Leader>uC"),
          -- vim-illuminate
          ["<Localleader>ur"] = replace_key("n", "<Leader>ur"),
          ["<Localleader>uR"] = replace_key("n", "<Leader>uR"),
          -- autoformatting
          ["<Localleader>uf"] = replace_key("n", "<Leader>uf"),
          ["<Localleader>uF"] = replace_key("n", "<Leader>uF"),
          -- lsp inlay hint
          ["<Localleader>uh"] = replace_key("n", "<Leader>uh"),
          ["<Localleader>uH"] = replace_key("n", "<Leader>uH"),
          -- CodeLens
          ["<Localleader>uL"] = replace_key("n", "<Leader>uL"),
          -- lsp sematic highlight
          ["<Localleader>uY"] = replace_key("n", "<Leader>uF"),
          -- automatic signature
          ["<Localleader>u?"] = replace_key("n", "<Leader>u?"),

          -- assistant category
          ["<Leader>;"] = { desc = "Assistant" },

          --
          -- setting a mapping to false will disable it
          --

          ["\\"] = false,
          ["|"] = false,
          ["jj"] = false,
          ["jk"] = false,
          ["<Leader>Q"] = false,

          -- neo-tree
          ["<Leader>o"] = false,

          -- heirline
          ["<Leader>b\\"] = false,
          ["<Leader>b|"] = false,
        },
      },
    })

    -- mappings
    opts.mappings = vim.tbl_deep_extend("force", opts.mappings, require "configs.mappings")

    -- options
    opts.options = vim.tbl_deep_extend("force", opts.options, require "configs.options")

    return opts
  end,
}
