for _, source in ipairs {
  "xj.core.bootstrap",
  "xj.core.options",
  "xj.core.lazy",
  "xj.core.autocmds",
  "xj.core.mappings",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

if xj.default_colorscheme then
  if not pcall(vim.cmd.colorscheme, xj.default_colorscheme) then
    require("xj.core.utils").notify(
      "Error setting up colorscheme: " .. xj.default_colorscheme,
      vim.log.levels.ERROR
    )
  end
end

require("xj.core.utils").conditional_func(xj.user_opts("polish", nil, false), true)
