-- some recommended exclusions. you can use `:lua print(vim.bo.filetype)` to
-- get the filetype string of the current buffer
local excluded_filetypes = {
  -- this one is especially useful if you use neovim as a commit message editor
  "gitcommit",
  -- most of these are usually set to non-modifiable, which prevents autosaving
  -- by default, but it doesn't hurt to be extra safe.
  "NvimTree",
  "Outline",
  "TelescopePrompt",
  "alpha",
  "dashboard",
  "lazygit",
  "neo-tree",
  "oil",
  "prompt",
  "toggleterm",
}

local excluded_filenames = {
  "do-not-autosave-me.lua",
}

local function save_condition(buf)
  if vim.fn.getbufvar(buf, "&modifiable") == 1 then
    return true -- met condition(s), can save
  end

  if
    vim.tbl_contains(excluded_filetypes, vim.fn.getbufvar(buf, "&filetype"))
    or vim.tbl_contains(excluded_filenames, vim.fn.expand "%:t")
  then
    return false
  end

  return true
end

return {
  "okuuva/auto-save.nvim",
  cmd = "ASToggle", -- optional for lazy loading on command
  event = { "InsertLeave", "TextChanged" },
  opts = {
    enabled = true,
    -- trigger_events = { -- See :h events
    --   immediate_save = { "BufLeave", "FocusLost" }, -- vim events that trigger an immediate save
    --   defer_save = { "InsertLeave", "TextChanged" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
    --   cancel_defered_save = { "InsertEnter" }, -- vim events that cancel a pending deferred save
    -- },
    condition = save_condition,
    debounce_delay = 2000,
  },
}
