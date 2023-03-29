local conf = require('xj.core.config')

return {
    'tpope/vim-fugitive',
    cmd = 'Git',
    enabled = not vim.tbl_contains(conf.disable_builtin_plugins, 'fugitive')
}
