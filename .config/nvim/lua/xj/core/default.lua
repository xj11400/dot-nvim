-- default config
local default = {
    border = 'rounded',
    disable_builtin_plugins = {},
    add_plugins = {},
    plugins = {
        lsp_lines = {
            -- additional flag only for CosmicNvim
            -- true - loads plugin and is enabled at start
            -- false - loads plugin but is not enabled at start
            -- you may use <leader>ld to toggle
            enable_on_start = false
        }
    },
    lsp = {
        format_on_save = true, -- true/false or table of filetypes {'.ts', '.js',}
        format_timeout = 2000,
        rename_notification = true,
        -- table of callbacks pushed via plugins
        on_attach_mappings = {},
        -- lsp servers that should be installed
        ensure_installed = {
            'astro',
            --[[ 'actionlint', ]]
            --[[ 'eslint_d', ]]
            --[[ 'prettierd', ]]
            'bashls',
            'cssls',
            'gopls',
            'graphql',
            'html',
            'jsonls',
            'tsserver',
            'lua_ls',
            'pyright',
            'svelte',
            'tailwindcss',
            'yamlls'
        },
        -- lsp servers that should be enabled
        servers = {
            astro = true,
            tailwindcss = true,
            jsonls = {
                format = false
            },
            pyright = true,
            lua_ls = {
                format = false
            },
            gopls = true,
            html = true,
            tsserver = {
                format = false
            }
        }
    }
}

return default
