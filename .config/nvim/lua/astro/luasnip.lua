-- https://github.com/l3mon4d3/luasnip/blob/master/DOC.md
-- NOTE: already in AstroNvim

-- NOTE: jumpping
-- after inputing text or making a selection
-- you need to  pressing <Tab><Esc>, as well to successfully move to the next field.
--
return {
  "L3MON4D3/LuaSnip",
  config = function(plugin, opts)
    -- include the default astronvim config that calls the setup call
    require "astronvim.plugins.configs.luasnip"(plugin, opts)

    -- load snippets paths
    require("luasnip.loaders.from_vscode").lazy_load {
      paths = { vim.fn.stdpath "config" .. "/snippets/vscode" },
    }
  end,

  keys = {
    { "<M-l>", function() require("luasnip").jump(1) end, mode = { "i", "s" } },
    { "<M-h>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    {
      "<C-l>",
      function()
        if require("luasnip").choice_active() then require("luasnip").change_choice(1) end
      end,
      mode = { "i", "s" },
    },
    {
      "<C-h>",
      function()
        if require("luasnip").choice_active() then require("luasnip").change_choice(-1) end
      end,
      mode = { "i", "s" },
    },
  },
}
