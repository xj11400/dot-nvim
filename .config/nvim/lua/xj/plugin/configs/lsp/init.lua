local conf = require('xj.core.config')

return {
    -- mason
    {
        'williamboman/mason.nvim',
        config = function()

            -- mason
            require('mason').setup({
                ui = {
                    border = conf.border
                }
            })
        end,
        event = 'BufEnter'
    },
    -- lsp server
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            'neovim/nvim-lspconfig'
        },
        config = function()
            -- mason-lspconfig
            require('mason-lspconfig').setup({
                ensure_installed = conf.lsp.ensure_installed.lsp_server,

                -- auto-install configured servers (with lspconfig)
                automatic_installation = true -- not the same as ensure_installed
            })
        end,
        event = 'BufEnter'
    },
    -- formatters
    {
        'jay-babu/mason-null-ls.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            'jose-elias-alvarez/null-ls.nvim'
        },
        config = function()
            require('mason-null-ls').setup({
                ensure_installed = vim.list_extend(conf.lsp.ensure_installed.linter, conf.lsp.ensure_installed.formatter),

                -- auto-install configured formatters & linters (with null-ls)
                automatic_installation = true
            })
        end,
        event = {
            'BufReadPre',
            'BufNewFile'
        }
    }
}
