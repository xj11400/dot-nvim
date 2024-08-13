return {
  "folke/twilight.nvim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Localleader>uW"] = { "<Cmd>Twilight<CR>", desc = "Toggle Twilight" },
          },
        },
      },
    },
  },
  cmd = {
    "Twilight",
    "TwilightEnable",
    "TwilightDisable",
  },
  opts = {
    dimming = {
      alpha = 0.5,
    },
    context = 20,
  },
}
