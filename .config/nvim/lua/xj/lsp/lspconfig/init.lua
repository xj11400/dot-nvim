-- set up lsp servers
local conf = require('xj.core.config')
local default_config = require('xj.lsp.providers.defaults')
local lspconfig = require('lspconfig')

local start_server = function(server)
    -- null_ls doesn't need/can't to be started via lspconfig
    if server == 'null_ls' then
        return
    end

    local opts = default_config

    -- set up server options
    local ok, server_conf = pcall(require, 'xj.lsp.providers.' .. server)
    if ok then
        opts = vim.tbl_deep_extend('force', opts, server_conf)
    end

    -- override options from config
    if type(conf.lsp.servers[server]) == 'table' then
        -- opts = vim.tbl_deep_extend('force', opts, conf.lsp.servers[server].opts or {})
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
