local conf = require('xj.core.config')
local default_config = require('xj.lsp.providers.defaults')
local null_ls = require('null-ls')
local opts = conf.lsp.servers.null_ls or {}

local function get_config_sources()
    if not opts.get_sources then
        return {}
    end

    return opts.get_sources()
end

opts.sources = vim.list_extend({
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.formatting.prettierd.with({
        env = {
            PRETTIERD_LOCAL_PRETTIER_ONLY = 1
        }
    }),
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.code_actions.gitsigns
}, get_config_sources())

null_ls.setup(vim.tbl_deep_extend('force', default_config, opts))
