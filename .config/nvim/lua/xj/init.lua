if vim.loader and vim.fn.has "nvim-0.9.1" == 1 then vim.loader.enable() end

for _, source in ipairs {
  "xj.core.bootstrap",
  "xj.config.options",
  "xj.core.lazy",
  "xj.config.autocmds",
  "xj.config.mappings",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

if xj.default_colorscheme then
  if not pcall(vim.cmd.colorscheme, xj.default_colorscheme) then
    require("xj.core.utils").notify(
      ("Error setting up colorscheme: `%s`"):format(xj.default_colorscheme),
      vim.log.levels.ERROR
    )
  end
end

require("xj.core.utils").conditional_func(xj.user_opts("polish", nil, false), true)
