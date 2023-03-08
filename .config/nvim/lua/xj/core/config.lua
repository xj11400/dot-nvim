-- configs
local ok, custom_config = pcall(require, 'xj.custom.config')

if not ok then
    custom_config = {}
end

local _, default_config = pcall(require, 'xj.core.default')

local config = vim.tbl_deep_extend('force', default_config, custom_config)

function config.lsp.add_on_attach_mapping(callback)
    table.insert(config.lsp.on_attach_mappings, callback)
end

return config
