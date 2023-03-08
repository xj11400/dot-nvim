local logger = require("xj.core.logger")
local M = {}

--- load config plugin
-- NvChad utils.load_override()
function M.plugin_config_override(plugin_name)

end

--- map
-- NvChad map
-- function M.map(mode, keys, command, opt)
function M.map(mode, keys, command, opt)
   local options = { noremap = true, silent = true }

   if opt then
      options = vim.tbl_extend("force", options, opt)
   end

   if type(keys) == "table" then
      for _, keymap in ipairs(keys) do
         M.map(mode, keymap, command, opt)
      end
      return
   end

   vim.keymap.set(mode, keys, command, opt)
end

---  scan directories
function M.scandir(directory)
    local pfile = assert(io.popen(("find '%s' -mindepth 1 -maxdepth 1 -type d -printf '%%f\\0'"):format(directory), 'r'))
    local list = pfile:read('*a')
    pfile:close()

    local folders = {}

    for filename in string.gmatch(list, '[^%z]+') do
        table.insert(folders, filename)
    end

    return folders
end

--- plugin tag
function M.plugin_tag(plugin_full_name)
    local plugin = string.gsub(plugin_full_name,".*/(%w+)","%1")
    plugin = string.gsub(plugin,"(%w+)(%.nvim)","%1")
    plugin = string.gsub(plugin,"(%w+)(%.lua)","%1")
    plugin = string.gsub(plugin,"%-","_")
    return plugin
end

--- init plugins TODO[Move to core.plugin?]
function M.plugin_list_init(plugins)
    for _,v in ipairs(plugins) do
        -- parse plugin name without .nvim
        local plugin = M.plugin_tag(v[1])

        -- add plugin active status
        xj.plugins[plugin] = {
            active = true
        }

        xj.plugins[plugin].config = {}
    end
end

--- plugin config override
--  - load table in "config.plugin"
--  - merge the table and value
function M.plugin_config_override(configs)
    for k,v in pairs(configs) do
        -- if xj.plugins has key k
        if xj.plugins[k] then

            for tag,conf in pairs(v) do
                if tag == "config" then
                    xj.plugins[k].config = vim.tbl_deep_extend("force",xj.plugins[k].config,conf)
                else
                    xj.plugins[k][tag] = conf
                end
            end

        else
            logger:debug("no key : "..k)
            xj.plugins[k] = configs[k]
        end
    end
end
return M
