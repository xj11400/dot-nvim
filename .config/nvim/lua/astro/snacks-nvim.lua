local get_icon = require("astroui").get_icon

return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            "",
            "",
            "> XJ_",
            "",
            "",
          }, "\n"),
          keys = {
            { key = "n", action = "<Localleader>n", icon = get_icon("FileNew", 0, true), desc = "New File  " },
            { key = "r", action = "<Leader>fo", icon = get_icon("DefaultFile", 0, true), desc = "Recents  " },
            { key = "f", action = "<Leader>ff", icon = get_icon("Search", 0, true), desc = "Find File  " },
            { key = "w", action = "<Leader>fw", icon = get_icon("WordFile", 0, true), desc = "Find Word  " },
            { key = "'", action = "<Leader>f'", icon = get_icon("Bookmarks", 0, true), desc = "Bookmarks  " },
            { key = "s", action = "<Localleader>sl", icon = get_icon("Refresh", 0, true), desc = "Last Session  " },
            {
              key = ".",
              action = "<Localleader>s.",
              icon = get_icon("Refresh", 0, true),
              desc = "Current Directory Session  ",
            },
          },
        },
        sections = {
          { section = "header", padding = 5 },
          { section = "keys", gap = 1, padding = 3 },
          { section = "startup", icon = "" },
        },
      },
      picker = {
        win = {
          input = {
            keys = {
              ["<C-J>"] = { "confirm", mode = { "n", "i" } },
            },
          },
          list = {
            keys = {
              ["<C-J>"] = "confirm",
            },
          },
        },
        -- hidden = true, -- Global toggle for hidden files
        exclude = { ".DS_Store" },
        sources = {
          files = {
            hidden = true,
            exclude = { ".direnv" },
          },
          explorer = {
            hidden = true,
            auto_close = true,
            tree = true,
            layout = "default",
          },
          grep = { hidden = true },
        },
      },
      explorer = {
        replace_netrw = true,
      },
      image = {
        enabled = true,
        doc = { enabled = true, inline = false, float = true, max_width = 80, max_height = 20 },
        math = {
          enabled = true,
        },
      },
      styles = {
        snacks_image = {
          border = "rounded",
          backdrop = false,
        },
      },
      lazygit = {
        theme = {
          activeBorderColor = { fg = "SnacksPickerTitle", bold = true },
        },
      },
    }
    return opts
  end,
  keys = {
    {
      "<Leader>fH",
      mode = { "n" },
      function() require("snacks").picker.highlights() end,
      desc = "Find highlights",
    },
    {
      "<Leader>fe",
      mode = { "n" },
      function() require("snacks").picker.explorer() end,
      desc = "Explorer",
    },
  },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        opts.autocmds.neotree_start = nil -- disable neotree on start
      end,
    },
  },
}
