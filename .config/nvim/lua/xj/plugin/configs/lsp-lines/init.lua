local conf = require('xj.core.config')
local vt_config = require('xj.lsp.diagnostics.config')
local map = require('xj.utility').map

local is_plugin_enabled = conf.plugins.lsp_lines.enable_on_start

local function toggle()
    if is_plugin_enabled then
        vim.diagnostic.config(vim.tbl_deep_extend('force', vt_config, {
            virtual_text = false,
            virtual_lines = true
        }))
    else
        vim.diagnostic.config(vim.tbl_deep_extend('force', vt_config, {
            virtual_lines = false
        }))
    end
    is_plugin_enabled = not is_plugin_enabled
end

return {
    url = 'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    keys = {
        {
            '<leader>ltl',
            toggle,
            desc = 'Toggle LSP Lines'
        }
    },
    config = function()
        -- init lsp_lines
        require('lsp_lines').setup()
        -- run once to properly show/hide based on user config
        toggle()
        -- map for toggling lines
        map('n', '<leader>ltl', '', {
            callback = toggle,
            desc = 'Toggle LSP Lines'
        })
    end,
    enabled = not vim.tbl_contains(conf.disable_builtin_plugins, 'lsp_lines')
}
