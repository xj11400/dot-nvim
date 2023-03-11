local conf = require('xj.core.config')
local u = require('xj.utility')

return {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
        local defaults = require('xj.lsp.providers.defaults')
        local null_ls = require('null-ls')
        local config_opts = vim.tbl_deep_extend('force', conf.lsp.servers.null_ls or {}, {
            default_cosmic_sources = true
        })
        if config_opts.default_cosmic_sources then
            local function get_config_sources()
                if not config_opts.get_sources then
                    return {}
                end

                return config_opts.get_sources()
            end

            config_opts.sources = u.merge_list({
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
        end

        null_ls.setup(vim.tbl_deep_extend('force', defaults, config_opts))
    end,
    event = 'VeryLazy',
    enabled = not vim.tbl_contains(conf.disable_builtin_plugins, 'null_ls')
}
