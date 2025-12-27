-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
local _zx = require "colors.zx"
-- local get_hlgroup = require("astroui").get_hlgroup
-- local _TabLine = get_hlgroup("TabLine", { fg = _zx.base.grey, bg = _zx.base.none })
-- local _Normal = get_hlgroup("Normal", { fg = _zx.base.fg, bg = _zx.base.bg })
--
-- local _mini_icons = require "mini.icons"
-- _mini_icons.get("default", "directory")

return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "astrodark",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },
      },
      astrodark = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
    },
    status = {
      -- Configure attributes of components defined in the `status` API. Check the AstroNvim documentation for a complete list of color names, this applies to colors that have `_fg` and/or `_bg` names with the suffix removed (ex. `git_branch_fg` as attributes from `git_branch`).
      attributes = {
        -- git_branch = { bold = true },
      },
      -- Configure colors of components defined in the `status` API. Check the AstroNvim documentation for a complete list of color names.
      colors = {
        tabline_bg = _zx.none,
        buffer_bg = _zx.none,
        buffer_fg = _zx.ui.text_inactive,
        buffer_active_fg = _zx.base.blue,
        buffer_visible_fg = _zx.syntax.comment,
        buffer_close_fg = _zx.base.grey,
        buffer_active_close_fg = _zx.base.fg,
        buffer_overflow_fg = _zx.base.grey,
        tab_close_fg = _zx.base.grey,
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      Toggle = "󰨙",
      Window = "",
      WordFile = "󰈭",
      Home = "",
      PowerOff = "",
      Save = "",
      ForceWrite = "",
      Assistant = "",
      Directory = "",
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
    lazygit = {
      theme = {
        activeBorderColor = { fg = "Title", bold = true },
      },
    },
  },
}
