local M = {}

---= [TODO] replace PLUGIN_NAME =---

--- [Packer] config
function M.config()
    require("xj.plugins.PLUGIN_NAME").configuration()
end

--- [Packer] setup
function M.setup()
    require("xj.plugins.PLUGIN_NAME").mapping()
end

----------------------------------------------

--- init config
-- function M.init()
--     local options = {
--         --= OPTIONS HERE =--
--     }
-- 
--     -- load options
--     xj.plugins.PLUGIN_NAME.config = vim.tbl_deep_extend("force", 
--     xj.plugins.PLUGIN_NAME.config,
--     options)
-- end

--- mapping
function M.mapping()
    local utils = require("xj.core.utils")
    local map = utils.map

    --= MAPPING HERE =--
end

--- configuration
function M.configuration()
  
    xj.plugins.PLUGIN_NAME.config = vim.tbl_deep_extend("force", {
        --= OPTIONS AFTER REQURE PLUGIN HERE =--
    }, xj.plugins.PLUGIN_NAME.config)
  
    -- plugin setup
    local load_ok, plugin = pcall( require, "PLUGIN_NAME") 

    if not load_ok then
        logger:error("Failed to load"..plugin)
        return
    end

    -- local logger = require("xj.core.logger")
    -- logger:debug("config plugin : PLUGIN_NAME")
    -- logger:debug(xj.plugins.PLUGIN_NAME.config)

    plugin.setup(xj.plugins.PLUGIN_NAME.config)
  
end

return M
