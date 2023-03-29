local conf = require('xj.core.config')

return {
    'norcalli/nvim-colorizer.lua',
    cmd = {
        'ColorizerToggle'
    },
    config = function()
        require('colorizer').setup(vim.tbl_deep_extend('force', {}, conf.plugins.colorizer or {}))
    end,
    enabled = not vim.tbl_contains(conf.disable_builtin_plugins, 'colorizer')
}
