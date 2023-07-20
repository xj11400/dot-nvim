M = {}

M.default = {
  palette = "dark",
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
    black_bg = true,
  },
  background = {
    light = "light",
    dark = "dark",
  },
  palettes = {
    global = {},
    dark = {},
    light = {},
  },
  highlights = {
    global = {},
    dark = {},
    light = {},
  },
  plugin_default = "auto",
  plugins = {},
}

function M.user_config(opts) return vim.tbl_deep_extend("force", M.default, opts or {}) end

return M
