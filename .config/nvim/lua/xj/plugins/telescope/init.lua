local M = {}

--- [Packer] config
function M.config()
    require("xj.plugins.telescope").configuration()
end

--- [Packer] setup
function M.setup()
    require("xj.plugins.telescope").mapping()
end

----------------------------------------------

--- mapping
function M.mapping()
    local utils = require("xj.core.utils")
    local map = utils.map

    map("n", "<leader>fb", "<cmd> :Telescope buffers <CR>")
    map("n", "<leader>ff", "<cmd> :Telescope find_files <CR>")
    map("n", "<leader>fa", "<cmd> :Telescope find_files follow=true no_ignore=true hidden=true <CR>")
    map("n", "<leader>gc", "<cmd> :Telescope git_commits <CR>")
    map("n", "<leader>gt", "<cmd> :Telescope git_status <CR>")
    map("n", "<leader>fh", "<cmd> :Telescope help_tags <CR>")
    map("n", "<leader>fw", "<cmd> :Telescope live_grep <CR>")
    map("n", "<leader>fo", "<cmd> :Telescope oldfiles <CR>")
    map("n", "<leader>th", "<cmd> :Telescope themes <CR>")
 
    -- pick a hidden term
    map("n", "<leader>W", "<cmd> :Telescope terms <CR>")
end

--- configuration
function M.configuration()
    local previewers = require "telescope.previewers"
    local sorters = require "telescope.sorters"
    local actions = require "telescope.actions"
  
    xj.plugins.telescope.config = vim.tbl_deep_extend("force", {
        defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            entry_prefix = "  ",
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "descending",
            layout_strategy = "horizontal",
            layout_config = {
                width = 0.75,
                preview_cutoff = 120,
                horizontal = {
                    preview_width = function(_, cols, _)
                        if cols < 120 then
                            return math.floor(cols * 0.5)
                        end
                        return math.floor(cols * 0.6)
                    end,
                    mirror = false,
                },
                vertical = { mirror = false },
            },
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--hidden",
                "--glob=!.git/",
            },
            file_ignore_patterns = {},
            path_display = { shorten = 5 },
            winblend = 0,
            border = {},
            borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            color_devicons = true,
            set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
            pickers = {
                    find_files = {
                        find_command = { "fd", "--type=file", "--hidden", "--smart-case" },
                    },
                live_grep = {
                    --@usage don't include the filename in the search results
                    only_sort_text = true,
                },
            },
        },
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            },
        },
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,
        file_sorter = sorters.get_fuzzy_file,
        generic_sorter = sorters.get_generic_fuzzy_sorter,
        ---@usage Mappings are fully customizable. Many familiar mapping patterns are setup as defaults.
        mappings = {
            i = {
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
                ["<C-c>"] = actions.close,
                ["<C-j>"] = actions.cycle_history_next,
                ["<C-k>"] = actions.cycle_history_prev,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                ["<CR>"] = actions.select_default + actions.center,
            },
            n = {
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
        },
    }, xj.plugins.telescope.config)
  
    -- plugin setup
    local load_ok, plugin = pcall( require, "telescope") 

    if not load_ok then
        logger:error("Failed to load"..plugin)
        return
    end

    -- local logger = require("xj.core.logger")
    -- logger:debug("config plugin : telescope...xxx")
    -- logger:debug(xj.plugins.telescope.config)

    plugin.setup(xj.plugins.telescope.config)
  
    if xj.plugins.project and xj.plugins.project.active then
      pcall(function()
        require("telescope").load_extension "projects"
      end)
    end
  
    if xj.plugins.telescope.config.on_config_done then
      xj.plugins.telescope.config.on_config_done(telescope)
    end
  
    if xj.plugins.telescope.config.extensions and xj.plugins.telescope.config.extensions.fzf then
      pcall(function()
        require("telescope").load_extension "fzf"
      end)
    end

end

return M
