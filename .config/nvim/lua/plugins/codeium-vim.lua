return {
  "Exafunction/codeium.vim",
  cmd = {
    "Codeium",
    "CodeiumEnable",
    "CodeiumDisable",
    "CodeiumToggle",
    "CodeiumAuto",
    "CodeiumManual",
  },
  event = "BufEnter",
  config = function()
    vim.g.codeium_disable_bindings = 1 -- disable default bindings
    vim.g.codeium_no_map_tab = true -- disable tab insert
  end,
  keys = {
    {
      "<Leader>;t",
      mode = { "n" },
      "<Cmd>CodeiumToggle<CR>",
      noremap = true,
      desc = "Toggle Codeium active",
    },
    {
      "<Leader>;;",
      mode = { "n" },
      function() return vim.fn["codeium#Chat()"]() end,
      noremap = true,
      desc = "Toggle Codeium Chat",
    },
    {
      -- "<C-g>",
      "<Tab><Tab>",
      mode = { "i" },
      function() return vim.fn["codeium#Accept"]() end,
      desc = "Codeium Accept",
      expr = true,
    },
    {
      "<C-x>",
      mode = { "i" },
      function() return vim.fn["codeium#Clear"]() end,
      desc = "Codeium Clear",
      expr = true,
    },
    -- {
    --   "<C-;>",
    --   mode = { "i" },
    --   function() return vim.fn["codeium#CycleCompletions"](1) end,
    --   desc = "Codeium Cycle Completions",
    --   expr = true,
    -- },
    -- {
    --   "<C-,>",
    --   mode = { "i" },
    --   function() return vim.fn["codeium#CycleCompletions"](-1) end,
    --   desc = "Codeium Cycle Completions",
    --   expr = true,
    -- },
  },
  dependencies = {
    {
      "AstroNvim/astroui",
      ---@type AstroUIOpts
      opts = {
        icons = {
          Codeium = "",
        },
      },
    },
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        return require("astrocore").extend_tbl(opts, {
          mappings = {
            n = {
              ["<Leader>;"] = {
                desc = require("astroui").get_icon("Codeium", 1, true) .. "Codeium",
              },
            },
          },
        })
      end,
    },
  },
}
