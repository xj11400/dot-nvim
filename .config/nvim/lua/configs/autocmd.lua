-- Auto change directory on startup
vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Auto change directory on startup",
  callback = function()
    local arg = vim.fn.argv(0)
    if arg == nil or arg == "" then return end

    arg = tostring(vim.fn.argv(0))

    -- determine if the first argument is a directory
    local stats = vim.uv.fs_stat(arg)
    if stats and stats.type == "directory" then
      -- change the current working directory
      vim.api.nvim_set_current_dir(arg)
    end
  end,
})
