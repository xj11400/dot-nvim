return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    opts.section.header.val = {
      "",
      "",
      "> XJ_",
      "",
      "",
    }

    opts.leader = "LDR"
    opts.localleader = "LOL"
    --- @param shortcut string Shortcut string of a button mapping
    --- @param desc string Real text description of the mapping
    --- @param rhs string? Righthand side of mapping if defining a new mapping (_optional_)
    --- @param map_opts table? `keymap.set` options used during keymap creating (_optional_)
    opts.button = function(shortcut, desc, rhs, map_opts)
      -- HACK: fixes leader customization, remove after fixed upstream
      -- https://github.com/goolord/alpha-nvim/pull/271
      local lhs = shortcut:gsub("%s", ""):gsub(opts.leader, "<Leader>"):gsub(opts.localleader, "<Localleader>")

      local default_map_opts = { noremap = true, silent = true, nowait = true, desc = desc }

      local leader = vim.g.mapleader
      if leader == " " then leader = "SPC" end

      local localleader = vim.g.maplocalleader
      if localleader == "\\" then localleader = "BSL" end

      return {
        type = "button",
        val = desc,
        on_press = function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(rhs or lhs .. "<Ignore>", true, false, true), "t", false)
        end,
        opts = {
          position = "center",
          shortcut = shortcut:gsub(opts.leader, leader):gsub(opts.localleader, localleader),
          cursor = -2,
          width = 36,
          align_shortcut = "right",
          hl = "DashboardCenter",
          hl_shortcut = "DashboardShortcut",
          keymap = rhs and { "n", lhs, rhs, require("astrocore").extend_tbl(default_map_opts, map_opts) },
        },
      }
    end

    local get_icon = require("astroui").get_icon
    opts.section.buttons.val = {
      opts.button("LOL n  ", get_icon("FileNew", 2, true) .. "New File  "),
      opts.button("LDR f f", get_icon("Search", 2, true) .. "Find File  "),
      opts.button("LDR f o", get_icon("DefaultFile", 2, true) .. "Recents  "),
      opts.button("LDR f w", get_icon("WordFile", 2, true) .. "Find Word  "),
      opts.button("LDR f '", get_icon("Bookmarks", 2, true) .. "Bookmarks  "),
      opts.button("LOL s l", get_icon("Refresh", 2, true) .. "Last Session  "),
    }
    return opts
  end,
  config = function(_, opts)
    require("alpha").setup(opts.config)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      desc = "Add Alpha dashboard footer",
      once = true,
      callback = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
        opts.section.footer.val =
          { "- " .. "Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins  in " .. ms .. "ms" .. " -" }
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
