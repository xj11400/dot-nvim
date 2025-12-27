return {
  "Exafunction/windsurf.vim",
  -- enabled = false,
  event = "BufEnter",
  cmd = "Codeium",
  build = ":Codeium Auth",
  config = function()
    vim.g.codeium_disable_bindings = 1 -- disable default bindings
    vim.g.codeium_no_map_tab = true -- disable tab insert
  end,
  keys = {
    {
      "<Leader>;c",
      mode = { "n" },
      "",
      desc = "Codeium",
    },
    {
      "<Leader>;ct",
      mode = { "n" },
      "<Cmd>CodeiumToggle<CR>",
      noremap = true,
      desc = "Toggle Codeium active",
    },
    {
      "<Leader>;cc",
      mode = { "n" },
      "<Cmd>CodeiumChat<CR>",
      noremap = true,
      desc = "Toggle Codeium Chat",
    },
    {
      "<Tab><Tab>",
      mode = { "i" },
      function() return vim.fn["codeium#Accept"]() end,
      desc = "Codeium Accept",
      expr = true,
    },
    {
      "<Tab>l",
      mode = { "i" },
      function() return vim.fn["codeium#AcceptNextLine"]() end,
      desc = "Codeium Accept Line",
      expr = true,
    },
    {
      "<Tab>f",
      mode = { "i" },
      function() return vim.fn["codeium#AcceptNextWord"]() end,
      desc = "Codeium Accept Word",
      expr = true,
    },
    {
      -- "<C-x>",
      "<Tab>x",
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
}
