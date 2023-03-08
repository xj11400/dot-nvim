local utils = require("xj.core.utils")
local M = {}

local logger =  require("xj.core.logger")

--- init
function M:init()
    -- Add Packer commands because we are not loading it at startup
    local user_cmd = vim.api.nvim_create_user_command
    local packer_cmd = function(callback)
       return function()
          require('xj.core.plugin'):setup()
          require("packer")[callback]()
       end
    end
    
    -- snapshot stuff
    user_cmd("PackerSnapshot", function(info)
       require "plugins"
       require("packer").snapshot(info.args)
    end, { nargs = "+" })
    
    user_cmd("PackerSnapshotDelete", function(info)
       require "plugins"
       require("packer.snapshot").delete(info.args)
    end, { nargs = "+" })
    
    user_cmd("PackerSnapshotRollback", function(info)
       require "plugins"
       require("packer").rollback(info.args)
    end, { nargs = "+" })
    
    user_cmd("PackerClean", packer_cmd "clean", {})
    user_cmd("PackerCompile", packer_cmd "compile", {})
    user_cmd("PackerInstall", packer_cmd "install", {})
    user_cmd("PackerStatus", packer_cmd "status", {})
    user_cmd("PackerSync", packer_cmd "sync", {})
    user_cmd("PackerUpdate", packer_cmd "update", {})

end

--- config
function M:config()

    --* plugin list init
    local plugins = require("xj.plugins")
    utils.plugin_list_init(plugins)

    --* load config file
    local status, conf = pcall(require,"xj.config.plugin")
    if status then 
        utils.plugin_config_override(conf.plugins)
    end

    --* find plugin config file
    for plugin, plugin_table in pairs(xj.plugins) do
        logger:debug("plugin: "..plugin)

        local status, retval = pcall(require,"xj.plugins."..plugin) 

        if status then
            logger:debug("found plugin config : "..plugin)
            plugin_table.config_file = retval
            pcall(plugin_table.config_file.init)
        end
    end

end

--- setup
function M:setup()
    -- pack init file
    local packer = self:packer()
    
    -- load plugins
    local plugins = require("xj.plugins")

    -- add disable = not xj.plugins.xxplugin.active
    for k,conf in ipairs(plugins) do
        local plugin = utils.plugin_tag(conf[1])

        --* if conf_file exist
        if xj.plugins[plugin].config_file then
            -- local plugin_config_file = xj.plugins[plugin].config_file
            local plugin_config_file = require("xj.plugins."..plugin)

            -- option : config
            if not plugins[k].config and plugin_config_file.config then
                plugins[k].config = plugin_config_file.config
            end
        
            -- option : setup
            if not plugins[k].setup and plugin_config_file.setup then
                plugins[k].setup = plugin_config_file.setup
            end
        end

        -- option : disable
        if conf[disable] == nil then
            plugins[k].disable = not xj.plugins[plugin].active
        end
    end

    logger:debug("plugins...setup()")
    
    -- Packer use plugins
    return packer.startup(function(use)
       for _, v in pairs(plugins) do
          use(v)
       end
    end)
end

--- packer init and load
function M:packer()
    logger:debug("plugin:packer()")

    vim.cmd "packadd packer.nvim"
    local present, packer = pcall(require, "packer")
    
    if not present then
        logger:debug("plugin:packer()... no packer")
       local packer_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
    
       print "Cloning packer.."
       -- remove the dir before cloning
       vim.fn.delete(packer_path, "rf")
       vim.fn.system {
          "git",
          "clone",
          "https://github.com/wbthomason/packer.nvim",
          "--depth",
          "1",
          packer_path,
       }
    
       vim.cmd "packadd packer.nvim"
       present, packer = pcall(require, "packer")
    
       if present then
          print "Packer cloned successfully."
       else
          error("Couldn't clone packer !\nPacker path: " .. packer_path .. "\n" .. packer)
       end
    end
    
    logger:debug("plugin:packer()... packer found...")
    packer.init {
       display = {
          open_fn = function()
             return require("packer.util").float { border = "single" }
          end,
          prompt_border = "single",
       },
       git = {
          clone_timeout = 6000, -- seconds
       },
       auto_clean = true,
       compile_on_sync = true,
    }
    
    return packer
end


return M
