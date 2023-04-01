local conf = require('xj.core.config')

return {
    'ptzz/lf.vim',
    dependencies = {
        'voldikss/vim-floaterm'
    },
    keys = {
        {
            '<localleader>f',
            '<cmd>FloatermNew lf<cr>',
            desc = 'LF'
        }
    },
    event = 'VeryLazy',
    enabled = not vim.tbl_contains(conf.disable_builtin_plugins, 'lf.vim')
}
