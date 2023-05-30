local conf = require('xj.core.config')
local icons = require('xj.utility.icons')

return {
    'glepnir/dashboard-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons'},
    config = function()
        require('dashboard').setup {
            -- config
            {
                shortcut = {
                  -- action can be a function type
                  { desc = string, group = 'highlight group', key = 'shortcut key', action = 'action when you press key' },
                },
                packages = { enable = true }, -- show how many plugins neovim loaded
                -- limit how many projects list, action when you press key or enter it will run this action.
                -- action can be a functino type, e.g.
                -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
                project = { enable = true, limit = 8, icon = 'your icon', label = '', action = 'Telescope find_files cwd=' },
                mru = { limit = 10, icon = 'your icon', label = '', },
                footer = {'__XJ'}, -- footer
              }
          }
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
