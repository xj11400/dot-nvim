return function(_, _)
  local lsp = require "xj.core.utils.lsp"
  local utils = require "xj.core.utils"
  local get_icon = utils.get_icon
  local signs = {
    { name = "DiagnosticSignError", text = get_icon "DiagnosticError", texthl = "DiagnosticSignError" },
    { name = "DiagnosticSignWarn", text = get_icon "DiagnosticWarn", texthl = "DiagnosticSignWarn" },
    { name = "DiagnosticSignHint", text = get_icon "DiagnosticHint", texthl = "DiagnosticSignHint" },
    { name = "DiagnosticSignInfo", text = get_icon "DiagnosticInfo", texthl = "DiagnosticSignInfo" },
    { name = "DapStopped", text = get_icon "DapStopped", texthl = "DiagnosticWarn" },
    { name = "DapBreakpoint", text = get_icon "DapBreakpoint", texthl = "DiagnosticInfo" },
    { name = "DapBreakpointRejected", text = get_icon "DapBreakpointRejected", texthl = "DiagnosticError" },
    { name = "DapBreakpointCondition", text = get_icon "DapBreakpointCondition", texthl = "DiagnosticInfo" },
    { name = "DapLogPoint", text = get_icon "DapLogPoint", texthl = "DiagnosticInfo" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, sign)
  end
  lsp.setup_diagnostics(signs)

  -- config diagnostics
  vim.diagnostic.config {
    virtual_text = false,
    underline = true,
  }

  local orig_handler = vim.lsp.handlers["$/progress"]
  vim.lsp.handlers["$/progress"] = function(_, msg, info)
    local progress, id = xj.lsp.progress, ("%s.%s"):format(info.client_id, msg.token)
    progress[id] = progress[id] and utils.extend_tbl(progress[id], msg.value) or msg.value
    if progress[id].kind == "end" then
      vim.defer_fn(function()
        progress[id] = nil
        utils.event "LspProgress"
      end, 100)
    end
    utils.event "LspProgress"
    orig_handler(_, msg, info)
  end

  if vim.g.lsp_handlers_enabled then
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", silent = true })
    vim.lsp.handlers["textDocument/signatureHelp"] =
      vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded", silent = true })
  end
  local setup_servers = function()
    vim.tbl_map(require("xj.core.utils.lsp").setup, xj.user_opts "lsp.servers")
    vim.api.nvim_exec_autocmds("FileType", {})
    require("xj.core.utils").event "LspSetup"
  end
  if require("xj.core.utils").is_available "mason-lspconfig.nvim" then
    vim.api.nvim_create_autocmd("User", {
      desc = "set up LSP servers after mason-lspconfig",
      pattern = "ZXMasonLspSetup",
      once = true,
      callback = setup_servers,
    })
  else
    setup_servers()
  end
end
