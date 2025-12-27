--- @module logger
--- A simple logging module for Neovim
---
--- This module provides a flexible logging system with different log levels
--- and the ability to write logs to a file.
---
--- @author xj
---
--- @usage
--- Initialization:
---     local logger = require('logger')
---     logger:init()
---
--- Logging:
---     logger:info('This is an info message')
---     logger:debug('This is a debug message')
---     logger:trace('This is a trace message')
---     logger:warn('This is a warning message')
---     logger:error('This is an error message')
---     logger:print('This is a print message')
---
---

local Log = {}

Log.levels = {
  TRACE = {
    priority = 1,
    str = "TRACE",
  },
  DEBUG = {
    priority = 2,
    str = "DEBUG",
  },
  INFO = {
    priority = 3,
    str = "INFO",
  },
  WARN = {
    priority = 4,
    str = "WARN",
  },
  ERROR = {
    priority = 5,
    str = "ERROR",
  },
  PRINT = {
    priority = 0,
    str = "PRINT",
  },
}

local debug_mode = false
local log_file_name = "x"

--- init
function Log:init(debug)
  -- config
  if type(debug) == "boolean" then debug_mode = debug end

  -- check directory exist
  local ok, err, code = os.rename(self:get_cache(), self:get_cache())
  if ok == nil then vim.fn.mkdir(self:get_cache(), "p") end

  -- file = io.open(os.getenv("HOME").."/.cache/nvim/logger","w")
  local file = io.open(self:get_path(), "w")
  if file then
    file:write "logger\n"
    file:write("time: " .. os.date "%Y/%m/%d %H:%M:%S" .. "\n")
    file:write "------------------------------------------------------------\n"
    file:close()
  end
end

-- write
function Log:write(level, msg, event)
  -- check event
  if event == nil then event = "" end

  -- debug_mode
  local info = ""
  if debug_mode then
    -- getinfo
    info = debug.getinfo(3, "S").source
    info = string.gsub(info, ".*config/nvim/lua/xj/(.*)", "%1")
    info = "(" .. info .. ")"
  end

  local file = io.open(self:get_path(), "a")

  if file then
    file:write("[" .. level.str .. "] ")
    file:write(self:str(msg) .. " " .. event .. info .. "\n")

    file:close()
  end
end

-- get cache dir
function Log:get_cache() return tostring(os.getenv "HOME" .. "/.cache/nvim") end

---Retrieves the path of the logfile
---@return string path of the logfile
function Log:get_path(file_name)
  if file_name == nil then file_name = log_file_name end
  return string.format("%s/%s.logger", Log:get_cache(), file_name)
end

--- TRACE
---@param msg any
---@param event any
function Log:trace(msg, event) self:write(self.levels.TRACE, msg, event) end

--- DEBUG
---@param msg any
---@param event any
function Log:debug(msg, event) self:write(self.levels.DEBUG, msg, event) end

--- INFO
---@param msg any
---@param event any
function Log:info(msg, event) self:write(self.levels.INFO, msg, event) end

--- WARN
---@param msg any
---@param event any
function Log:warn(msg, event) self:write(self.levels.WARN, msg, event) end

--- ERROR
---@param msg any
---@param event any
function Log:error(msg, event) self:write(self.levels.ERROR, msg, event) end

--- PRINT
function Log:print(msg, event) self:write(self.levels.PRINT, msg, event) end

--- check type and to string
---@param msg any
function Log:str(msg)
  if type(msg) == "table" then
    msg = self:tbl_str(msg)
  else
    msg = tostring(msg)
  end

  return msg
end

--- table to string
---@param msg table
---@param indent number
function Log:tbl_str(msg, indent)
  local str = "\n"

  if not indent then indent = 2 end

  str = str .. string.rep("  ", indent - 2) .. "{" .. "\n"

  for k, v in pairs(msg) do
    if type(v) == "table" then
      v = self:tbl_str(v, indent + 2)
    elseif type(v) == "string" then
      v = '"' .. v .. '"'
    else
      v = tostring(v)
    end
    str = str .. string.rep("  ", indent) .. k .. " : " .. v .. ",\n"
  end

  str = str .. string.rep("  ", indent - 2) .. "}"
  return str
end

return Log
