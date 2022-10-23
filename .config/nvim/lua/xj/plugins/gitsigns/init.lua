local M = {}

--- [Packer] config
function M.config()
    require("xj.plugins.gitsigns").configuration()
end

--- [Packer] setup
function M.setup()
    require("xj.plugins.gitsigns").mapping()
end

----------------------------------------------

--- init config
-- function M.init()
--     local options = {
--         --= OPTIONS HERE =--
--     }
-- 
--     -- load options
--     xj.plugins.gitsigns.config = vim.tbl_deep_extend("force", 
--     xj.plugins.gitsigns.config,
--     options)
-- end

--- mapping
function M.mapping()
    local utils = require("xj.core.utils")
    local map = utils.map

    -- Navigation
    map("n", "<leader>j", ":Gitsigns next_hunk<CR>")
    map("n", "<leader>k",":Gitsigns prev_hunk<CR>")

    -- Actions 
    map("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
    map("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
    map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
    map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>")
    map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")
    map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
    map("n", "<leader>hb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
    map("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
    map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>")
    map("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
    map("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>")
end

--- configuration
function M.configuration()
  
    xj.plugins.gitsigns.config = vim.tbl_deep_extend("force", {
        signs = {
            add = {
                hl = "GitSignsAdd",
                text = "▎",
                numhl = "GitSignsAddNr",
                linehl = "GitSignsAddLn",
            },
            change = {
                hl = "GitSignsChange",
                text = "▎",
                numhl = "GitSignsChangeNr",
                linehl = "GitSignsChangeLn",
            },
            delete = {
                hl = "GitSignsDelete",
                text = "_",
                numhl = "GitSignsDeleteNr",
                linehl = "GitSignsDeleteLn",
            },
            topdelete = {
                hl = "GitSignsDelete",
                text = "‾",
                numhl = "GitSignsDeleteNr",
                linehl = "GitSignsDeleteLn",
            },
            changedelete = {
                hl = "GitSignsChange",
                text = "~",
                numhl = "GitSignsChangeNr",
                linehl = "GitSignsChangeLn",
            },
        },
        numhl = false,
        linehl = false,
        keymaps = {
            -- Default keymap options
            noremap = true,
            buffer = true,
        },
        signcolumn = true,
        word_diff = false,
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
        },
        current_line_blame_formatter_opts = {
            relative_time = false,
        },
        max_file_length = 40000,
        preview_config = {
            -- Options passed to nvim_open_win
            border = "rounded",
            style = "minimal",
            relative = "cursor",
            row = 0,
            col = 1,
        },
        watch_gitdir = {
            interval = 1000,
            follow_files = true,
        },
        sign_priority = 6,
        update_debounce = 200,
        status_formatter = nil, -- Use default
    }, xj.plugins.gitsigns.config)
  
    -- plugin setup
    local load_ok, plugin = pcall( require, "gitsigns") 

    if not load_ok then
        logger:error("Failed to load"..plugin)
        return
    end

    -- local logger = require("xj.core.logger")
    -- logger:debug("config plugin : gitsigns")
    -- logger:debug(xj.plugins.gitsigns.config)

    plugin.setup(xj.plugins.gitsigns.config)
  
end

return M
