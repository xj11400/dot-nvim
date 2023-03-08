local M = {}

--- [Packer] config
function M.config()
    require("xj.plugins.nvim_tree").configuration()
end

--- [Packer] setup
function M.setup()
    require("xj.plugins.nvim_tree").mapping()
end

----------------------------------------------

--- init config
function M.init()

    -- [TODO] which key
    if xj.plugins.which_key then
        xj.plugins.which_key.mappings["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" }
    end

end

--- mapping
function M.mapping()
    local utils = require("xj.core.utils")
    local map = utils.map

    map("n", "<leader>e", "<cmd> :NvimTreeToggle <CR>")
    map("n", "<leader>ee", "<cmd> :NvimTreeFocus <CR>")
end

--- configuration
function M.configuration()

    -- local vim_show_icons = xj.use_icons and 1 or 0
    local vim_show_icons = xj.use_icons and true or false

    xj.plugins.nvim_tree.config = vim.tbl_deep_extend("force", {
        disable_netrw = true,
        hijack_netrw = true,
        open_on_setup = false,
        open_on_setup_file = false,
        sort_by = "name",
        ignore_buffer_on_setup = false,
        ignore_ft_on_setup = {"startify", "dashboard", "alpha"},
        auto_reload_on_write = true,
        hijack_unnamed_buffer_when_opening = false,
        hijack_directories = {
            enable = true,
            auto_open = true
        },
        open_on_tab = false,
        hijack_cursor = false,
        update_cwd = false,
        diagnostics = {
            enable = xj.use_icons,
            show_on_dirs = false,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = ""
            }
        },
        update_focused_file = {
            enable = true,
            update_cwd = true,
            ignore_list = {}
        },
        system_open = {
            cmd = nil,
            args = {}
        },
        git = {
            enable = true,
            ignore = false,
            timeout = 200
        },
        view = {
            width = 30,
            height = 30,
            hide_root_folder = false,
            side = "left",
            preserve_window_proportions = false,
            mappings = {
                custom_only = false,
                list = {}
            },
            number = false,
            relativenumber = false,
            signcolumn = "yes"
        },
        renderer = {
            highlight_git = true,
            root_folder_modifier = ":t",
            highlight_opened_files = "none",
            add_trailing = false,
            indent_markers = {
                enable = false,
                icons = {
                    corner = "└ ",
                    edge = "│ ",
                    none = "  "
                }
            },
            icons = {
                webdev_colors = xj.use_icons,
                show= {
                    git = vim_show_icons,
                    folder = vim_show_icons,
                    file = vim_show_icons,
                    folder_arrow = vim_show_icons
                },
                glyphs = {
                    default = "",
                    symlink = "",
                    git = {
                        unstaged = "",
                        staged = "S",
                        unmerged = "",
                        renamed = "➜",
                        deleted = "",
                        untracked = "U",
                        ignored = "◌"
                    },
                    folder = {
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = ""
                    }
                },
            },
        },
        filters = {
            dotfiles = false,
            custom = {"node_modules", "\\.cache"},
            exclude = {}
        },
        trash = {
            cmd = "trash",
            require_confirm = true
        },
        log = {
            enable = false,
            truncate = false,
            types = {
                all = false,
                config = false,
                copy_paste = false,
                diagnostics = false,
                git = false,
                profile = false
            }
        },
        actions = {
            use_system_clipboard = true,
            change_dir = {
                enable = true,
                global = false,
                restrict_above_cwd = false
            },
            open_file = {
                quit_on_open = false,
                resize_window = false,
                window_picker = {
                    enable = true,
                    chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                    exclude = {
                        filetype = {"notify", "packer", "qf", "diff", "fugitive", "fugitiveblame"},
                        buftype = {"nofile", "terminal", "help"}
                    }
                }
            }
        }
    }, xj.plugins.nvim_tree.config)
  
    -- nvim_tree global setting
    -- for opt, val in pairs(xj.plugins.nvim_tree.config.global) do
    --     vim.g["nvim_tree_" .. opt] = val
    -- end

    -- plugin setup
    local load_ok, plugin = pcall( require, "nvim-tree") 

    if not load_ok then
        logger:error("Failed to load"..plugin)
        return
    end

    -- Implicitly update nvim_tree when project module is active
    if xj.plugins.project and xj.plugins.project.active then
        xj.plugins.nvim_tree.config.global.respect_buf_cwd = 1
        xj.plugins.nvim_tree.config.update_cwd = true
        xj.plugins.nvim_tree.config.update_focused_file = { enable = true, update_cwd = true }
    end

    local function telescope_find_files(_)
        M.start_telescope "find_files"
    end

    local function telescope_live_grep(_)
        M.start_telescope "live_grep"
    end

    -- Add useful keymaps
    if #xj.plugins.nvim_tree.config.view.mappings.list == 0 then
        xj.plugins.nvim_tree.config.view.mappings.list = {
            { key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
            { key = "h", action = "close_node" },
            { key = "v", action = "vsplit" },
            { key = "C", action = "cd" },
            { key = "gtf", action = "telescope_find_files", action_cb = telescope_find_files },
            { key = "gtg", action = "telescope_live_grep", action_cb = telescope_live_grep },
        }
    end

    -- local logger = require("xj.core.logger")
    -- logger:debug("config plugin : nvim_tree")
    -- logger:debug(xj.plugins.nvim_tree.config)

    plugin.setup(xj.plugins.nvim_tree.config)


    -- ??? TODO 
    if xj.plugins.nvim_tree.on_config_done then
        xj.plugins.nvim_tree.on_config_done(nvim_tree)
    end
end

function M.start_telescope(telescope_mode)
  local node = require("nvim_tree.lib").get_node_at_cursor()
  local abspath = node.link_to or node.absolute_path
  local is_folder = node.open ~= nil
  local basedir = is_folder and abspath or vim.fn.fnamemodify(abspath, ":h")
  require("telescope.builtin")[telescope_mode] {
    cwd = basedir,
  }
end
  

return M
