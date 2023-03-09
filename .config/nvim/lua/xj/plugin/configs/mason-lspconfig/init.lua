return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        'williamboman/mason.nvim'
    },
    config = function()
        local conf = require('xj.core.config')
        require('mason').setup({
            ui = {
                border = conf.border
            }
        })
        require('mason-lspconfig').setup({
            ensure_installed = conf.lsp.ensure_installed
        })

        -- set up lsp servers
        local default_config = require('xj.lsp.providers.defaults')
        local lspconfig = require('lspconfig')

        local start_server = function(server)
            -- null_ls doesn't need/can't to be started via lspconfig
            if server == 'null_ls' then
                return
            end

            local opts = default_config

            -- set up default options
            if server == 'tsserver' then
                opts = vim.tbl_deep_extend('force', opts, require('xj.lsp.providers.tsserver'))
            elseif server == 'jsonls' then
                opts = vim.tbl_deep_extend('force', opts, require('xj.lsp.providers.jsonls'))
            elseif server == 'pyright' then
                opts = vim.tbl_deep_extend('force', opts, require('xj.lsp.providers.pyright'))
            elseif server == 'lua_ls' then
                opts = vim.tbl_deep_extend('force', opts, require('xj.lsp.providers.lua_ls'))
            end

            -- override options if user definds them
            if type(conf.lsp.servers[server]) == 'table' then
                if conf.lsp.servers[server].opts ~= nil then
                    opts = vim.tbl_deep_extend('force', opts, conf.lsp.servers[server].opts)
                end
            end

            lspconfig[server].setup(opts)
        end

        for config_server, config_opt in pairs(conf.lsp.servers) do
            if not config_opt == false then
                start_server(config_server)
            end
        end
    end,
    event = 'BufEnter'
}
