local conf = require('xj.core.config')

return {
    'folke/which-key.nvim',
    config = function()
        local wk = require('which-key')
        wk.setup({
            window = {
                border = conf.border,
                position = 'bottom',
                margin = {
                    1,
                    0,
                    1,
                    0
                },
                padding = {
                    3,
                    2,
                    3,
                    2
                },
                winblend = 20
            },
            layout = {
                height = {
                    min = 4,
                    max = 25
                },
                width = {
                    min = 20,
                    max = 50
                },
                spacing = 8,
                align = 'center'
            }
        })

        wk.register({
            ['<leader>'] = {
                b = {
                    name = '+buffer'
                },
                c = {
                    name = '+quickfix'
                },
                f = {
                    name = '+find'
                },
                h = {
                    name = '+gitsigns',
                    t = {
                        name = '+toggle'
                    }
                },
                l = {
                    name = '+lsp',
                    d = {
                        name = '+diagnostics'
                    },
                    t = {
                        name = '+toggle'
                    },
                    w = {
                        name = '+workspace'
                    }
                },
                g = {
                    name = '+goto'
                },
                e = {
                    name = '+tree'
                },
                s = {
                    name = '+session'
                },
                t = {
                    name = '+tab'
                },
                p = {
                    name = '+lazy (plugins)'
                },
                v = {
                    name = '+git (vsc)',
                    t = {
                        name = '+toggle'
                    }
                }
            },
            ['<localleader>'] = {
                p = {
                    name = '+plugin'
                }
            }
        })
    end,
    event = 'VeryLazy',
    enabled = not vim.tbl_contains(conf.disable_builtin_plugins, 'which-key')
}
