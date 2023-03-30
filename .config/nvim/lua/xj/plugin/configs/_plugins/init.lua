local conf = require('xj.core.config')

local plugins = vim.tbl_deep_extend('force', {
    'MunifTanjim/nui.nvim',
    'jceb/vim-orgmode',
    'psliwka/vim-smoothie'
}, conf.add_plugins)

return plugins
