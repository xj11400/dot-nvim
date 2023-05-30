M = {}

M.default = {
  palette = "dark",
  termguicolors = true,
  terminal_colors = true,
  background = "dark",
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
