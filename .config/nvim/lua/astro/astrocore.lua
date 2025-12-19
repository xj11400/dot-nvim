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
        t = {},
        n = {},
      },
    })

    --
    -- Mapping Functions
    --

    local set_mapping = function(mode, key, value)
      local maps = assert(opts.mappings)
      local modes = type(mode) == "table" and mode or { mode }

      for _, m in ipairs(modes) do
        if not maps[m] then maps[m] = {} end
        maps[m][key] = value
      end
    end

    local replace_mapping = function(mode, source_key, to_key)
      local maps = assert(opts.mappings)

      local modes = type(mode) == "table" and mode or { mode }

      for _, m in ipairs(modes) do
        local mode_map = maps[m]

        if mode_map and mode_map[source_key] ~= nil then
          local tmp = mode_map[source_key]
          mode_map[source_key] = false
          mode_map[to_key] = tmp
        end
      end
    end

    local disable_mapping = function(mode, key)
      local maps = assert(opts.mappings)
      local modes = type(mode) == "table" and mode or { mode }

      for _, m in ipairs(modes) do
        local mode_map = maps[m]
        if mode_map and mode_map[key] ~= nil then mode_map[key] = false end
      end
    end

    local get_key = function(mode, key)
      local maps = assert(opts.mappings)
      local tmp = vim.tbl_get(maps, mode)[key]
      return tmp
    end

    --
    -- Mappings
    --

    -- assistants category
    set_mapping("n", "<Leader>;", { desc = get_icon("Assistant", 1, true) .. "Assistant" })

    -- toggleterm
    set_mapping({ "n", "t" }, "<Localleader>`", { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" })
    set_mapping("t", "<Localleader><esc>", { "<C-\\><C-n>", desc = "Toggle terminal visual" })
    replace_mapping({ "n", "t", "i" }, "<C-'>", "<C-\\>")

    -- heirline
    set_mapping("n", '<Leader>b"', {
      function()
        require("astroui.status.heirline").buffer_picker(function(bufnr)
          vim.cmd.split()
          vim.api.nvim_win_set_buf(0, bufnr)
        end)
      end,
      desc = "Horizontal split buffer from tabline",
    })
    set_mapping("n", "<Leader>b%", {
      function()
        require("astroui.status.heirline").buffer_picker(function(bufnr)
          vim.cmd.vsplit()
          vim.api.nvim_win_set_buf(0, bufnr)
        end)
      end,
      desc = "Vertical split buffer from tabline",
    })

    -- mapping to Localleader
    set_mapping("n", "<Leader>q", { "<Cmd>q<CR>", desc = "Quit" })
    set_mapping("n", "<Localleader>q", { "<Cmd>confirm q<CR>", desc = "Quit" })
    set_mapping("n", "<Localleader>Q", { "<Cmd>confirm qall<CR>", desc = "Exit" })
    replace_mapping("n", "<Leader>w", "<Localleader>w")
    replace_mapping("n", "<Leader>n", "<Localleader>n")
    set_mapping("n", "<Localleader>R", { function() require("astrocore").reload() end, desc = "Reload" })
    set_mapping("n", "<Leader>bt", { desc = "Tab" })
    set_mapping("n", "<Leader>btn", { "<Cmd>tabnew<CR>", desc = "New Tab" })
    set_mapping("n", "<Leader>btc", { "<Cmd>tabclose<CR>", desc = "Close Tab" })
    set_mapping("n", "<Leader>bts", { "<Cmd>tab split<CR>", desc = "Split Tab" })

    --
    -- Replace mappings
    --

    -- alpha
    replace_mapping("n", "<Leader>h", "<Localleader>h")

    -- Plugin Manager
    replace_mapping("n", "<Leader>p", "<Localleader>p")
    replace_mapping("n", "<Leader>pa", "<Localleader>pa")
    replace_mapping("n", "<Leader>pi", "<Localleader>pi")
    replace_mapping("n", "<Leader>ps", "<Localleader>ps")
    replace_mapping("n", "<Leader>pS", "<Localleader>pS")
    replace_mapping("n", "<Leader>pu", "<Localleader>pu")
    replace_mapping("n", "<Leader>pU", "<Localleader>pU")
    replace_mapping("n", "<Leader>pm", "<Localleader>pm")
    replace_mapping("n", "<Leader>pM", "<Localleader>pM")

    -- Session
    replace_mapping("n", "<Leader>S", "<Localleader>s")
    replace_mapping("n", "<Leader>Sl", "<Localleader>sl")
    replace_mapping("n", "<Leader>Ss", "<Localleader>ss")
    replace_mapping("n", "<Leader>SS", "<Localleader>sS")
    replace_mapping("n", "<Leader>St", "<Localleader>st")
    replace_mapping("n", "<Leader>Sd", "<Localleader>sd")
    replace_mapping("n", "<Leader>SD", "<Localleader>sD")
    replace_mapping("n", "<Leader>Sf", "<Localleader>sf")
    replace_mapping("n", "<Leader>SF", "<Localleader>sF")
    replace_mapping("n", "<Leader>S.", "<Localleader>s.")

    -- UI/UX
    replace_mapping("n", "<Leader>u", "<Localleader>u")
    replace_mapping("n", "<Leader>uA", "<Localleader>uA")
    replace_mapping("n", "<Leader>ub", "<Localleader>ub")
    replace_mapping("n", "<Leader>ud", "<Localleader>ud")
    replace_mapping("n", "<Leader>ug", "<Localleader>ug")
    replace_mapping("n", "<Leader>u>", "<Localleader>u>")
    replace_mapping("n", "<Leader>ui", "<Localleader>ui")
    replace_mapping("n", "<Leader>ul", "<Localleader>ul")
    replace_mapping("n", "<Leader>un", "<Localleader>un")
    replace_mapping("n", "<Leader>uN", "<Localleader>uN")
    replace_mapping("n", "<Leader>up", "<Localleader>up")
    replace_mapping("n", "<Leader>us", "<Localleader>us")
    replace_mapping("n", "<Leader>uS", "<Localleader>uS")
    replace_mapping("n", "<Leader>ut", "<Localleader>ut")
    replace_mapping("n", "<Leader>uu", "<Localleader>uu")
    replace_mapping("n", "<Leader>uw", "<Localleader>uw")
    replace_mapping("n", "<Leader>uy", "<Localleader>uy")
    replace_mapping("n", "<Leader>uv", "<Localleader>uv")
    replace_mapping("n", "<Leader>uV", "<Localleader>uV")
    replace_mapping("n", "<Leader>uZ", "<Localleader>uZ")

    -- autopairs
    replace_mapping("n", "<Leader>ua", "<Localleader>ua")
    -- notify
    replace_mapping("n", "<Leader>uD", "<Localleader>uD")
    -- indent-blankline
    replace_mapping("n", "<Leader>u|", "<Localleader>u|")
    -- colorizer
    replace_mapping("n", "<Leader>uz", "<Localleader>uz")
    -- cmp_lunasnip
    replace_mapping("n", "<Leader>uc", "<Localleader>uc")
    replace_mapping("n", "<Leader>uC", "<Localleader>uC")
    -- vim-illuminate
    replace_mapping("n", "<Leader>ur", "<Localleader>ur")
    replace_mapping("n", "<Leader>uR", "<Localleader>uR")
    -- autoformatting
    replace_mapping("n", "<Leader>uf", "<Localleader>uf")
    replace_mapping("n", "<Leader>uF", "<Localleader>uF")
    -- lsp inlay hint
    replace_mapping("n", "<Leader>uh", "<Localleader>uh")
    replace_mapping("n", "<Leader>uH", "<Localleader>uH")
    -- CodeLens
    replace_mapping("n", "<Leader>uL", "<Localleader>uL")
    -- lsp sematic highlight
    replace_mapping("n", "<Leader>uF", "<Localleader>uY")
    -- automatic signature
    replace_mapping("n", "<Leader>u?", "<Localleader>u?")

    --
    -- Disable mappings
    --

    -- setting a mapping to false will disable it
    disable_mapping("n", "\\")
    disable_mapping("n", "|")
    disable_mapping("n", "jj")
    disable_mapping("n", "jk")
    disable_mapping("n", "<Leader>Q")

    -- smart-splits: disable bindings in AstroNvim
    disable_mapping({ "n", "t" }, "<C-H>")
    disable_mapping({ "n", "t" }, "<C-J>")
    disable_mapping({ "n", "t" }, "<C-K>")
    disable_mapping({ "n", "t" }, "<C-L>")

    -- neo-tree
    disable_mapping("n", "<Leader>o")

    -- heirline
    disable_mapping("n", "<Leader>b\\")
    disable_mapping("n", "<Leader>b|")

    -- toggleterm
    disable_mapping("n", "<Leader>tu")
    disable_mapping("n", "<Leader>tp")
    disable_mapping("n", "<Leader>tn")

    --
    -- Disable default keymap
    --
    vim.keymap.del({ "n", "x", "o" }, "gc")
    vim.keymap.del("n", "gcc")
    vim.keymap.set({ "n", "x", "o" }, "gc", "", { desc = "Toggle comment" })

    --- Default maps for built-in commenting.
    --- See |gc-default| and |gcc-default|.
    --- gc -> gcc, gcc -> gcl
    do
      local operator_rhs = function() return require("vim._comment").operator() end
      vim.keymap.set({ "n", "x" }, "gcc", operator_rhs, { expr = true, desc = "Toggle comment" })

      local line_rhs = function() return require("vim._comment").operator() .. "_" end
      vim.keymap.set("n", "gcl", line_rhs, { expr = true, desc = "Toggle comment line" })

      local textobject_rhs = function() require("vim._comment").textobject() end
      vim.keymap.set({ "o" }, "gcc", textobject_rhs, { desc = "Comment textobject" })

      local maps = opts.mappings
      maps.n["<Leader>/"] = { line_rhs(), desc = "Toggle comment line" }
      maps.x["<Leader>/"] = { operator_rhs(), desc = "Toggle comment" }
    end

    --
    -- Load configs
    --

    -- mappings
    opts.mappings = vim.tbl_deep_extend("force", opts.mappings, require "configs.mappings")

    -- options
    opts.options = vim.tbl_deep_extend("force", opts.options, require "configs.options")

    return opts
  end,
}
