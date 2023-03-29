local conf = require('xj.core.config')

return {
    'L3MON4D3/LuaSnip',
    config = function()
        local ls = require('luasnip')
        ls.config.set_config(vim.tbl_deep_extend('force', {
            history = true,
            -- Update more often, :h events for more info.
            updateevents = 'TextChanged,TextChangedI',
            enable_autosnippets = true
        }, conf.plugins.luasnip or {}))

        -- extend html snippets to react files
        require('luasnip').filetype_extend('javascriptreact', {
            'html'
        })
        require('luasnip').filetype_extend('typescriptreact', {
            'html'
        })

        -- load snippets (friendly-snippets)
        require('luasnip.loaders.from_vscode').lazy_load()
    end,
    dependencies = {
        'rafamadriz/friendly-snippets'
    },
    enabled = not vim.tbl_contains(conf.disable_builtin_plugins, 'luasnip')
}
