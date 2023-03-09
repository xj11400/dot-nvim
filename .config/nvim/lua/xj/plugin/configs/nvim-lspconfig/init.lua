local conf = require('xj.core.config')

return {
    'neovim/nvim-lspconfig',
    enabled = not vim.tbl_contains(conf.disable_builtin_plugins, 'nvim-lspconfig')
}
