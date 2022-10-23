local M = {}

--- [Packer] config
function M.config()
    require("xj.plugins.nvim_notify").configuration()
end

--- [Packer] setup
function M.setup()
    require("xj.plugins.nvim_notify").mapping()
end

----------------------------------------------

--- init config
function M.init()
    xj.plugins.nvim_notify.active = xj.plugins.nvim_notify.active or xj.plugins.telescope.active
end

--- mapping
function M.mapping()
    local utils = require("xj.core.utils")
    local map = utils.map

    --= MAPPING HERE =--
end

--- configuration
function M.configuration()
  
    xj.plugins.nvim_notify.config = vim.tbl_deep_extend("force", {
        ---@usage Animation style one of { "fade", "slide", "fade_in_slide_out", "static" }
        stages = xj.colorscheme and "fade_in_slide_out" or "static",

            ---@usage Function called when a new window is opened, use for changing win settings/config
        on_open = nil,

        ---@usage Function called when a window is closed
        on_close = nil,

        ---@usage timeout for notifications in ms, default 5000
        timeout = 5000,

        -- Render function for notifications. See notify-render()
        render = "default",

        ---@usage highlight behind the window for stages that change opacity
        background_colour = "Normal",

        ---@usage minimum width for notification windows
        minimum_width = 50,

        ---@usage Icons for the different levels
        icons = {
            ERROR = "",
            WARN = "",
            INFO = "",
            DEBUG = "",
            TRACE = "✎"
        }
    }, xj.plugins.nvim_notify.config)
  
    if not xj.use_icons then
        xj.plugins.nvim_notify.config.icons = {
            ERROR = "[ERROR]",
            WARN = "[WARNING]",
            INFO = "[INFo]",
            DEBUG = "[DEBUG]",
            TRACE = "[TRACE]"
        }
    end

    -- plugin setup
    local load_ok, plugin = pcall( require, "notify") 

    if not load_ok then
        logger:error("Failed to load"..plugin)
        return
    end

    -- local logger = require("xj.core.logger")
    -- logger:debug("config plugin : nvim_notify")
    -- logger:debug(xj.plugins.nvim_notify.config)

    plugin.setup(xj.plugins.nvim_notify.config)
    
    -- set vim.notify
    vim.notify = plugin
  
end

return M
