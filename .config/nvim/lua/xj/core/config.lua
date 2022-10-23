-- init()
-- - initialize xj default configuration
-- - 
-- load()
-- - override configuration
-- reload
--


local M = {}

--- initialize xj default configuration
-- define xj
function M:init()
    if vim.tbl_isempty(xj or {}) then
        xj = vim.deepcopy(require("xj.core.default"))
    end

    -- keymapping
    -- require("xj.general.keymappings")
    
    -- options
    -- require("xj.general.options")

    -- autocmds
    -- require("xj.general.autocmds")

    -- plugins
    require("xj.core.plugin"):config()

    -- lsp config
    -- require("xj.lsp")

end

function M:load()
    -- config file
    pcall(require,"xj.config")
end

function M:reload()
    self:init()
    self:load()
end

return M
