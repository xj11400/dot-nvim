local conf = require('xj.core.config')

return {
    'rmagatti/auto-session',
    lazy = false,
    config = function()
        require('auto-session').setup(vim.tbl_deep_extend('force', {
            pre_save_cmds = {
                'NvimTreeClose',
                'cclose',
                'lua vim.notify.dismiss()'
            },
            auto_session_enabled = true,
            auto_restore_enabled = true,
            auto_save_enabled = true
        }, conf.plugins.auto_session or {}))
    end,
    init = function()
        require('xj.plugin.configs.auto-session.mappings')
    end,
    enabled = not vim.tbl_contains(conf.disable_builtin_plugins, 'auto-session')
}
