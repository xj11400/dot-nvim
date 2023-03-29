local conf = require('xj.core.config')
local icons = require('xj.utility.icons')

return {
    'glepnir/dashboard-nvim',
    config = function()
        vim.g.dashboard_custom_header = {
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            ''
        }

        vim.g.dashboard_default_executive = 'telescope'

        vim.g.dashboard_session_directory = vim.fn.stdpath('data') .. '/sessions'

        vim.g.dashboard_custom_section = {
            find_file = {
                description = {
                    icons.file1 .. ' Find File           <leader>ff'
                },
                command = 'lua require("xj.plugin.configs.telescope.mappings").project_files()'
            },
            file_explorer = {
                description = {
                    icons.file2 .. ' File Manager        <C-n>     '
                },
                command = 'NvimTreeToggle'
            },
            find_string = {
                description = {
                    icons.word .. ' Grep String         <leader>fs'
                },
                command = 'Telescope grep_string'
            },
            last_session = {
                description = {
                    icons.clock .. ' Load Session        <leader>sl'
                },
                command = 'lua vim.cmd(":silent RestoreSession")'
            }
        }

        vim.g.dashboard_custom_footer = {
            '> XJ_'
        }
    end,
    event = 'VimEnter',
    enabled = not vim.tbl_contains(conf.disable_builtin_plugins, 'dashboard')
}
