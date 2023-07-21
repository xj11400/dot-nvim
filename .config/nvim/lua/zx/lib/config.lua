M = {}

M.default = {
  palette = "zxdark",
  termguicolors = true,
  terminal_colors = true,
  dev = false,
  style = {
    transparent = false,
    inactive = true,
    float = true,
    popup = true,
    neotree = true,
    border = true,
    title_invert = false,
    italic_comments = true,
    simple_syntax_colors = false,
    black_bg = false,
  },
  background = {
    light = "zxlight",
    dark = "zxdark",
  },
  palettes = {
    global = {},
  },
  highlights = {
    global = {},
  },
  plugin_default = "auto",
  plugins = {},
  transparent = {
    list = {
      'tabline',
      'tool',
      'base',
      'inactive_base',
      'statusline',
      'popup',
      'float',
    },
  },
}

function M.user_config(opts) return vim.tbl_deep_extend("force", M.default, opts or {}) end

return M
