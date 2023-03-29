local conf = require('xj.core.config')
local icons = require('xj.utility.icons')

return {
    'kyazdani42/nvim-tree.lua',
    config = function()
        require('nvim-tree').setup(vim.tbl_deep_extend('force', {
            respect_buf_cwd = true,
            diagnostics = {
                enable = true,
                icons = {
                    hint = icons.hint,
                    info = icons.info,
                    warning = icons.warn,
                    error = icons.error
                }
            },
            ignore_ft_on_setup = {
                'startify',
                'dashboard',
                'alpha'
            },
            update_focused_file = {
                enable = true
            },
            view = {
                width = 35,
                number = true,
                relativenumber = true
            },
            git = {
                ignore = true
            },
            renderer = {
                highlight_git = true,
                special_files = {},
                icons = {
                    glyphs = {
                        default = '',
                        symlink = icons.symlink,
                        git = icons.git,
                        folder = icons.folder
                    }
                }
            }
        }, conf.plugins.nvim_tree or {}))
    end,
    init = function()
        require('xj.plugin.configs.nvim-tree.mappings')
    end,
    cmd = {
        'NvimTreeClipboard',
        'NvimTreeFindFile',
        'NvimTreeOpen',
        'NvimTreeRefresh',
        'NvimTreeToggle'
    },
    enabled = not vim.tbl_contains(conf.disable_builtin_plugins, 'nvim-tree')
}
