-- plugins
local conf = require('xj.core.config')

require('lazy').setup('xj.plugin.configs', {
    lockfile = vim.fn.stdpath('config') .. '/lazy-lock.json',
    defaults = {
        lazy = true
    },
    ui = {
        border = conf.border,
        size = {
            width = 0.7,
            height = 0.7
        }
    },
    performance = {
        rtp = {
            disabled_plugins = {
                'netrw',
                'netrwPlugin',
                'netrwSettings',
                'netrwFileHandlers',
                'gzip',
                'zip',
                'zipPlugin',
                'tar',
                'tarPlugin',
                'getscript',
                'getscriptPlugin',
                'vimball',
                'vimballPlugin',
                '2html_plugin',
                'logipat',
                'rrhelper',
                'spellfile_plugin',
                'matchit'
            }
        }
    }
})
