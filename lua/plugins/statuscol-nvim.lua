return {
  "luukvbaal/statuscol.nvim",
  lazy = false,
  specs = {
    {
      "rebelot/heirline.nvim",
      optional = true,
      opts = function(_, opts) opts.statuscolumn = nil end,
    },
  },
  opts = function(_, opts)
    local builtin = require "statuscol.builtin"
    return {
      relculright = true,
      segments = {
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        {
          sign = { namespace = { "diagnostic/signs" }, maxwidth = 1, auto = true },
          click = "v:lua.ScSa",
        },
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
        {
          sign = { namespace = { "gitsigns" }, maxwidth = 1, auto = false },
          click = "v:lua.ScSa",
        },
        {
          sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
          click = "v:lua.ScSa",
        },
      },
    }
  end,
  dependencies = {
    {
      "AstroNvim/astroui",
      ---@type AstroUIOpts
      opts = {
        icons = {
          GitSign = "┃",
        },
      },
    },
  },
  -- enabled = false,
}
