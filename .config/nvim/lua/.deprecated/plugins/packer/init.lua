local M = {}

--- [Packer] config
-- function M.config()
--     require("xj.plugins.packer").configuration()
-- end

--- [Packer] setup
-- function M.setup()
--     require("xj.plugins.packer").mapping()
-- end

----------------------------------------------

--- init config
function M.init()
    local utils = require("xj.core.utils")
    local map = utils.map

    map("n","<localleader>psc","<cmd> :PackerSync <CR>")
    map("n","<localleader>pst","<cmd> :PackerStatus <CR>")
end

-- --- mapping
-- function M.mapping()
--     local utils = require("xj.core.utils")
--     local map = utils.map
-- 
--     --= MAPPING HERE =--
-- end
-- 
-- --- configuration
-- function M.configuration()
--   
--     xj.plugins.packer.config = vim.tbl_deep_extend("force", {
--         --= OPTIONS AFTER REQURE PLUGIN HERE =--
--     }, xj.plugins.packer.config)
--   
--     -- plugin setup
--     local load_ok, plugin = pcall( require, "packer") 
-- 
--     if not load_ok then
--         logger:error("Failed to load"..plugin)
--         return
--     end
-- 
--     -- local logger = require("xj.core.logger")
--     -- logger:debug("config plugin : packer")
--     -- logger:debug(xj.plugins.packer.config)
-- 
--     plugin.setup(xj.plugins.packer.config)
--   
-- end

return M
