return {
  {
    "askfiy/smart-translate.nvim",
    -- enabled = false,
    cmd = { "Translate" },
    dependencies = {
      "askfiy/http.nvim", -- a wrapper implementation of the Python aiohttp library that uses CURL to send requests.
    },
    opts = {
      default = {
        cmds = {
          source = "auto",
          target = "zh-TW",
          handle = "float",
          engine = "google",
        },
        cache = true,
      },
    },
    keys = {
      {
        "<Leader>;t",
        mode = { "v" },
        "<Cmd>Translate<CR>",
        desc = "Translate",
      },
    },
  },
  {
    "uga-rosa/translate.nvim",
    enabled = false,
    cmd = { "Translate" },
    keys = {
      {
        "<Leader>;t",
        mode = { "v", "x" },
        "<Cmd>Translate zh-TW<CR>",
        desc = "Translate",
      },
    },
  },
}
