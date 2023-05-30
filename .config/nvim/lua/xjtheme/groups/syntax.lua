-- Subgroups inherit highlights from their primary groups by default.
-- While unnecessary, we define all subgroups and their highlights
-- for completeness.
--
-- Syntax group hierachry (e.g.):
--   - Constant (Primary group)
--       - String (Subgroup)
--       - Character (Subgroup)
--
-- Ref: :help group-name
local c = require("xjtheme.palettes.vsc_colors")

local function callback()
  return {
    -- Comment
    Comment = { fg = c.vscGreen, bg = c.vscNone },
    -- Constant
    Constant = { fg = c.vscBlue, bg = c.vscNone },
    String = { fg = c.vscOrange, bg = c.vscNone },
    Character = { fg = c.vscOrange, bg = c.vscNone },
    Number = { fg = c.vscLightGreen, bg = c.vscNone },
    Boolean = { fg = c.vscBlue, bg = c.vscNone },
    Float = { fg = c.vscLightGreen, bg = c.vscNone },
    -- Identifier
    Identifier = { fg = c.vscLightBlue, bg = c.vscNone },
    Function = { fg = c.vscYellow, bg = c.vscNone },
    -- Statement
    Statement = { fg = c.vscPink, bg = c.vscNone },
    Conditional = { fg = c.vscPink, bg = c.vscNone },
    Repeat = { fg = c.vscPink, bg = c.vscNone },
    Label = { fg = c.vscPink, bg = c.vscNone },
    Operator = { fg = c.vscFront, bg = c.vscNone },
    Keyword = { fg = c.vscPink, bg = c.vscNone },
    Exception = { fg = c.vscPink, bg = c.vscNone },
    -- Preproc
    PreProc = { fg = c.vscPink, bg = c.vscNone },
    Include = { fg = c.vscPink, bg = c.vscNone },
    Define = { fg = c.vscPink, bg = c.vscNone },
    Macro = { fg = c.vscPink, bg = c.vscNone },
    PreCondit = { fg = c.vscViolet, bg = C.none }, -- preprocessor #if, #else, #endif, etc.
    -- Type
    Type = { fg = c.vscBlue, bg = c.vscNone },
    StorageClass = { fg = c.vscBlue, bg = c.vscNone },
    Structure = { fg = c.vscBlueGreen, bg = c.vscNone },
    Typedef = { fg = c.vscBlue, bg = c.vscNone },
    -- Special
    Special = { fg = c.vscYellowOrange, bg = c.vscNone },
    SpecialChar = { fg = c.vscFront, bg = c.vscNone },
    Tag = { fg = c.vscFront, bg = c.vscNone },
    Delimiter = { fg = c.vscFront, bg = c.vscNone },
    SpecialComment = { fg = c.vscGreen, bg = c.vscNone },
    Debug = { fg = c.vscFront, bg = c.vscNone },
    -- Underlined
    Underlined = { fg = c.vscNone, bg = c.vscNone, underline = true },
    -- Ignore
    Ignore = { fg = c.vscFront, bg = c.vscNone },
    -- Error
    Error = { fg = c.vscRed, bg = c.vscBack, undercurl = true, sp = c.vscRed },
    -- Todo
    Todo = { fg = c.vscYellowOrange, bg = c.vscBack, bold = true },
  }
end
return callback
