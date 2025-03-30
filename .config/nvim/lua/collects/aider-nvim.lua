return {
  "joshuavial/aider.nvim",
  opts = {
    default_bindings = false,
    auto_manage_context = false,
  },
  keys = {
    { "<Leader>;a",
      function() require("aider").AiderOpen() end, desc = "Toggle Aider" },
  },
  enabled = false,
}
