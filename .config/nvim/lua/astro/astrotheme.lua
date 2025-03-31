return {
  "AstroNvim/astrotheme",
  opts = function(_, opts)
    -- opts = require("astrotheme.lib.config").default
    opts = { palettes = { global = {} }, highlights = { global = {} } }

    --
    -- ZX Theme
    --
    local _zx = require "colors.zx"
    -- zx palettes
    opts.palettes.global = vim.tbl_deep_extend("force", opts.palettes.global, _zx)
    -- zx highlights
    opts.highlights.global = {
      -- first parameter is the highlight table and the second parameter is the color palette table
      modify_hl_groups = function(hl, c) -- modify_hl_groups function allows you to modify hl groups,
        hl.CursorColumn = { fg = _zx.ui.text_inactive, bg = _zx.none }
        hl.IncSearch = { fg = _zx.ui.base, bg = _zx.ui.yellow }
        hl.Comment.italic = true
        -- Whichkey
        hl.WhichKey = { fg = _zx.ui.text }
        hl.WhichKeyDesc = { fg = _zx.ui.text_inactive }
        hl.WhichKeySeperator = { fg = _zx.ui.none_text }
        hl.WhichKeyGroup = { fg = _zx.ui.none_text }
        -- neo-tree
        hl.NeoTreeTabSeparatorActive = { fg = opts.style.transparent and _zx.ui.split or _zx.ui.tool, bg = _zx.ui.tool }
        hl.NeoTreeTabSeparatorInactive =
          { fg = opts.style.transparent and _zx.ui.split or _zx.ui.tabline, bg = _zx.ui.tabline }
        -- flash
        hl.FlashLabel = { fg = _zx.ui.base, bg = _zx.ui.blue, bold = true }
        -- snack
        hl.SnacksDashboardHeader = { fg = _zx.ui.text }
        hl.SnacksDashboardFooter = { fg = _zx.ui.text }
        hl.SnacksDashboardDesc = { fg = _zx.ui.text }
        hl.SnacksDashboardKey = { fg = _zx.ui.text }
      end,
      -- ["@String"] = {fg = "", bg = "NONE"},
    }

    -- ------------------------------------------------------------------------------------------ >> start
    -- [Experiment]
    --
    opts = vim.tbl_deep_extend("force", opts, {
      style = {
        -- transparent = true,
        -- black_bg = true,
      },
      transparent = {
        list = {
          ui = {
            -- 'tabline',
            "tool",
            "base",
            "inactive_base",
            "statusline",
            "popup",
            "float",
          },
          highlights = {
            fg = {
              "NeoTreeTabSeparatorActive",
              "NeoTreeTabSeparatorInactive",
            },
            bg = {},
          },
        },
      },
    })

    --
    -- ZX background
    --
    local target_color = nil
    if opts.style.transparent then
      target_color = _zx.none
    elseif opts.style.black_bg then
      target_color = "black"
    end
    if target_color then
      for _, elem in pairs(opts.transparent.list.ui) do
        opts.palettes.global.ui[elem] = target_color
      end
    end

    --
    -- Set opts to astrotheme
    --
    local _astrotheme = require "astrotheme"
    _astrotheme.config = opts

    --
    -- overwirte colors
    --
    _astrotheme.overwrite_colors = function(opts)
      local _palette = opts.palettes.global
      local target_color = nil
      if opts.style.transparent then
        target_color = _zx.none
      elseif opts.style.black_bg then
        target_color = "#000000"
      end

      -- backup origin colors
      if opts.transparent.cache == nil then
        opts.transparent.cache = { ui = {}, highlights = { bg = {}, fg = {} } }
        -- ui
        for _, elem in pairs(opts.transparent.list.ui) do
          opts.transparent.cache.ui[elem] = _palette.ui[elem]
        end
        -- highlights.fg
        for _, elem in pairs(opts.transparent.list.highlights.fg) do
          opts.transparent.cache.highlights.fg[elem] = vim.api.nvim_get_hl(0, { name = elem })
        end
        -- highlights.bg
        for _, elem in pairs(opts.transparent.list.highlights.bg) do
          opts.transparent.cache.highlights.bg[elem] = vim.api.nvim_get_hl(0, { name = elem })
        end
      end

      -- overwirte or restore
      if opts.style.transparent or opts.style.black_bg then
        -- ui
        for _, elem in pairs(opts.transparent.list.ui) do
          _palette.ui[elem] = target_color
        end
        -- highlights.fg highlights.bg
        opts.highlights.global = {
          modify_hl_groups = function(hl, c)
            for _, elem in pairs(opts.transparent.list.highlights.fg) do
              hl[elem] = { fg = target_color }
            end
            for _, elem in pairs(opts.transparent.list.highlights.bg) do
              hl[elem] = { bg = target_color }
            end
          end,
        }
      elseif not vim.tbl_isempty(opts.transparent.cache) and not target_color then
        -- ui
        for _, elem in pairs(opts.transparent.list.ui) do
          _palette.ui[elem] = opts.transparent.cache.ui[elem]
        end
        -- highlights.fg highlights.bg
        opts.highlights.global = {
          modify_hl_groups = function(hl, c)
            for _, elem in pairs(opts.transparent.list.highlights.fg) do
              hl[elem].fg = opts.transparent.cache.highlights.fg[elem].fg
            end
            for _, elem in pairs(opts.transparent.list.highlights.bg) do
              hl[elem].bg = opts.transparent.cache.highlights.bg[elem].bg
            end
          end,
        }
      end
    end

    -- _astrotheme.overwrite_colors(_astrotheme.config)

    ---
    --- Transparent
    ---
    _astrotheme.toggle_transparent = function(opt)
      if opt == nil then
        _astrotheme.config.style.transparent = not _astrotheme.config.style.transparent
      else
        _astrotheme.config.style.transparent = opt
      end

      _astrotheme.overwrite_colors(_astrotheme.config)
      _astrotheme.load()
    end

    vim.api.nvim_create_user_command(
      "ZXToggleTransparent",
      function() _astrotheme.toggle_transparent() end,
      { desc = "ZX Theme Toggle Transparent" }
    )

    ---
    --- Black Background
    ---
    _astrotheme.toggle_black_bg = function(opt)
      if opt == nil then
        _astrotheme.config.style.black_bg = not _astrotheme.config.style.black_bg
      else
        _astrotheme.config.style.black_bg = opt
      end

      _astrotheme.overwrite_colors(_astrotheme.config)
      _astrotheme.load()
    end

    vim.api.nvim_create_user_command(
      "ZXToggleBlack",
      function() _astrotheme.toggle_black_bg() end,
      { desc = "ZX Theme Toggle Black Background" }
    )
    -- ------------------------------------------------------------------------------------------ <<  end

    return opts
  end,
}
