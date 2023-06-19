local utils = require "astronvim.utils"
return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            if opts.ensure_installed ~= "all" then
                opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "c", "cpp" })
            end
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = function(_, opts)
            opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "clangd" })
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        opts = function(_, opts)
            opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "clang-format", "cpplint" })
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "codelldb") end,
    },
    {
        -- This is needed for pylint to work in a virtualenv. See https://github.com/williamboman/mason.nvim/issues/668#issuecomment-1320859097
        "williamboman/mason.nvim",
        opts = {
            PATH = "append",
        },
    },
}
