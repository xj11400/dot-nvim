return {
    'williamboman/mason.nvim',
    dependencies = {
        -- lspconfig
        'neovim/nvim-lspconfig',
        'williamboman/mason-lspconfig.nvim',
        -- null-ls
        'jay-babu/mason-null-ls.nvim',
        'jose-elias-alvarez/null-ls.nvim'
    },
    config = function()
        local conf = require('xj.core.config')

        -- mason
        require('mason').setup({
            ui = {
                border = conf.border
            }
        })

        -- mason-lspconfig
        require('mason-lspconfig').setup({
            ensure_installed = conf.lsp.ensure_installed.lsp_server,

            -- auto-install configured servers (with lspconfig)
            automatic_installation = true -- not the same as ensure_installed
        })

        -- mason-null-ls
        require('mason-null-ls').setup({
            ensure_installed = vim.list_extend(conf.lsp.ensure_installed.linter, conf.lsp.ensure_installed.formatter),

            -- auto-install configured formatters & linters (with null-ls)
            automatic_installation = true
        })
    end,
    event = 'BufEnter'
}
