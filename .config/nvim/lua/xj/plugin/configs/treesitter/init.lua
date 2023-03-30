local conf = require('xj.core.config')

return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'windwp/nvim-ts-autotag',
        'JoosepAlviste/nvim-ts-context-commentstring',
        'nvim-treesitter/nvim-treesitter-refactor'
    },
    event = 'BufEnter',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup(vim.tbl_deep_extend('force', {
            ensure_installed = {
                'astro',
                'c',
                'cmake',
                'cpp',
                'css',
                'go',
                'html',
                'javascript',
                'jsdoc',
                'json',
                'lua',
                'markdown',
                'markdown_inline',
                'php',
                'python',
                'regex',
                'rust',
                'scss',
                'tsx',
                'typescript',
                'vim',
                'yaml'
            },
            highlight = {
                enable = true,
                use_languagetree = true
            },
            indent = {
                enable = true
            },
            autotag = {
                enable = true
            },
            context_commentstring = {
                enable = true,
                enable_autocmd = false
            },
            refactor = {
                highlight_definitions = {
                    enable = true
                },
                highlight_current_scope = {
                    enable = false
                }
            }
        }, conf.plugins.treesitter or {}))
    end,
    enabled = not vim.tbl_contains(conf.disable_builtin_plugins, 'treesitter')
}
