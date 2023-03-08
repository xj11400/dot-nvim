-- 
-- local colorscheme = "z"
-- 
-- local status_ok, _ = pcall(vim.cmd,"colorscheme "..colorscheme)
-- if not status_ok then
--     vim.notify("colorscheme " .. colorscheme .. "not found!")
--     return
-- end

-- vim.opt.termguicolors = true

-- local status_ok, theme = pcall(require,"xj.colors."..colortheme)
-- pcall(require,"xj.colors."..colortheme)

---------------------------------------------NvChad
require("xj.colors.theme.onedarker.lua.onedarker").setup()
