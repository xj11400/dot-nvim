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
    debounce_delay = 2000,
  },
}
