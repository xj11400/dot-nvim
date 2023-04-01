local conf = require('xj.core.config')

return {
    'voldikss/vim-floaterm',
    cmd = {
        'FloatermToggle',
        'FloatermNew'
    },
    keys = {
        {
            '<leader>`',
            '<cmd>FloatermToggle<cr>',
            desc = 'Floating Terminal'
        },
        {
            '<localleader>g',
            '<cmd>FloatermNew lazygit<cr>',
            desc = 'Lazygit'
        },
        {
            '<localleader>r',
            '<cmd>FloatermNew ranger<cr>',
            desc = 'Ranger'
        }
    },
    config = function()
        local title = vim.env.SHELL

        vim.g.floaterm_width = 0.7
        vim.g.floaterm_height = 0.8
        vim.g.floaterm_title = '[' .. title .. ']:($1/$2)'
        vim.g.floaterm_borderchars = '─│─│╭╮╯╰'
        vim.g.floaterm_opener = 'vsplit'

        require('xj.plugin.configs.terminal.highlights')
        require('xj.plugin.configs.terminal.mappings')
    end,
    enabled = not vim.tbl_contains(conf.disable_builtin_plugins, 'terminal')
}
