-- packer specifying plugins
-- -------------------------
-- https://github.com/wbthomason/packer.nvim#specifying-plugins
-- ```
-- use {
--   'myusername/example',        -- The plugin location string
--   -- The following keys are all optional
--   disable = boolean,           -- Mark a plugin as inactive
--   as = string,                 -- Specifies an alias under which to install the plugin
--   installer = function,        -- Specifies custom installer. See "custom installers" below.
--   updater = function,          -- Specifies custom updater. See "custom installers" below.
--   after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
--   rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
--   opt = boolean,               -- Manually marks a plugin as optional.
--   branch = string,             -- Specifies a git branch to use
--   tag = string,                -- Specifies a git tag to use. Supports '*' for "latest tag"
--   commit = string,             -- Specifies a git commit to use
--   lock = boolean,              -- Skip updating this plugin in updates/syncs. Still cleans.
--   run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
--   requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
--   rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
--   config = string or function, -- Specifies code to run after this plugin is loaded.
--   -- The setup key implies opt = true
--   setup = string or function,  -- Specifies code to run before this plugin is loaded.
--   -- The following keys all imply lazy-loading and imply opt = true
--   cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
--   ft = string or list,         -- Specifies filetypes which load this plugin.
--   keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
--   event = string or list,      -- Specifies autocommand events which load this plugin.
--   fn = string or list          -- Specifies functions which load this plugin.
--   cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
--   module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
--                                -- with one of these module names, the plugin will be loaded.
--   module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When
--   requiring a string which matches one of these patterns, the plugin will be loaded.
-- }
-- ```
-- ------------------------------------------------------------------------------------------------------------------
-- {
--     "xxx/xxxPlugin.nvim",           -- The plugin location string
--     module = "xxxplugin",           -- Specifies Lua module names for require. When requiring a string which starts
--                                     -- with one of these module names, the plugin will be loaded.
--     cmd = "xxxPlugin",              -- Specifies commands which load this plugin. Can be an autocmd pattern.
--     requires = {                    -- Specifies plugin dependencies. See "dependencies".
--         "zzz/zzzplugin.nvim"
--     }
--     config = function()             -- Specifies code to run after this plugin is loaded. (string or function)
--         require("xj.plugin.xxxPlugin").setup()
--     end,
--     setup = function()              -- Specifies code to run before this plugin is loaded. (string or function)
--         require("xj.plugin.xxxPlugin").mappings()
--     end,
--     disable = boolean,              -- Mark a plugin as inactive
-- }

local plugins = {
    --[[
        
    --]]
    -- packer manage itself
    {
       "wbthomason/packer.nvim",
       event = "VimEnter",
    },

    -- useful lua functions used in lots of plugins
    { "nvim-lua/plenary.nvim" },

    -- This plugin does several things to speed loading Lua modules and files.
    -- impatient needs to be setup before any other lua plugin is loaded
    { "lewis6991/impatient.nvim" },

    -- An implementation of the Popup API from vim in Neovim
    { "nvim-lua/popup.nvim" },

    -- Icons
    { "kyazdani42/nvim-web-devicons" },

    -- Telescope
    { 
        "nvim-telescope/telescope.nvim",
        requires = {
           "nvim-lua/plenary.nvim",
           "kyazdani42/nvim-web-devicons"
         },
        module = "telescope",
        cmd = "Telescope",
    },

    -- file explorer
    {
        "kyazdani42/nvim-tree.lua",
        -- requires = {
        --    "kyazdani42/nvim-web-devicons"    -- for file icon
        -- },
        -- tag = 'nightly',    -- optional, updated every week
    },

    -- 
    { "psliwka/vim-smoothie" },
-----------------------------------------------------------------------
    { "nathom/filetype.nvim" },
    { 
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
    },

    -- notify
    {
        "rcarriga/nvim-notify",
        requires = {
            "nvim-telescope/telescope.nvim"
        },
    },

    -- status line
    {
        "nvim-lualine/lualine.nvim",
    },


    -- buffer line
    {
        "akinsho/bufferline.nvim",
        branch = "main",
        event = "BufWinEnter",
    },

    -- 
    --- - {
    --- -     "nvim-treesitter/nvim-treesitter",
    --- - },





    --[[
        
    --]]
    -- color temp
--     {
--         "lunarvim/onedarker.nvim",
--         config = function()
--           pcall(function()
--               require("onedarker").setup()
--           end)
--         end,
--     },
}

return plugins
