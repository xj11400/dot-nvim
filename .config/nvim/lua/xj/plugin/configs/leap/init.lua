local conf = require('xj.core.config')

return {
    'ggandor/leap.nvim',
    dependencies = 'tpope/vim-repeat',
    config = function()
        require('leap').add_default_mappings()
    end,
    -- keys = {
    -- 	{ "f", "<Plug>(leap-forward-to)", mode = { "o" } },
    -- 	{ "F", "<Plug>(leap-backwardeto)", mode = { "o" } },
    -- },
    event = {
        'BufReadPost',
        'BufNewFile'
    },
    enabled = not vim.tbl_contains(conf.disable_builtin_plugins, 'leap')
}
