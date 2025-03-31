local get_icon = require("astroui").get_icon

return {
  "folke/snacks.nvim",
  opts =  {
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
          { key = "f", action = "<Leader>ff", icon = get_icon("Search", 0, true), desc = "Find File  " },
          { key = "o", action = "<Leader>fo", icon = get_icon("DefaultFile", 0, true), desc = "Recents  " },
          { key = "w", action = "<Leader>fw", icon = get_icon("WordFile", 0, true), desc = "Find Word  " },
          { key = "'", action = "<Leader>f'", icon = get_icon("Bookmarks", 0, true), desc = "Bookmarks  " },
          { key = "s", action = "<Localleader>Sl", icon = get_icon("Refresh", 0, true), desc = "Last Session  " },
        },
      },
      sections = {
        { section = "header", padding = 5 },
        { section = "keys", gap = 1, padding = 3 },
        { section = "startup", icon = ""}
      }
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
    },
  },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n["<Leader>fH"] = { function() require("snacks").picker.highlights() end, desc = "Find highlights" }
      end,
    },
  },
}
