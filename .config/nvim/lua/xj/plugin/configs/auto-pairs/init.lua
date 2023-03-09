local conf = require('xj.core.config')

return {
    'windwp/nvim-autopairs',
    config = function()
        require('nvim-autopairs').setup(vim.tbl_deep_extend('force', {
            check_ts = true,
            ts_config = {
                lua = {
                    'string',
                    'source'
                },
                javascript = {
                    'string',
                    'template_string'
                },
                java = false
            },
            disable_filetype = {
                'TelescopePrompt',
                'vim'
            },
            fast_wrap = {}
        }, conf.plugins.nvim_autopairs or {}))
    end,
    enabled = not vim.tbl_contains(conf.disable_builtin_plugins, 'autopairs')
}
