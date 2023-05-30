local c = require("xjtheme.palettes.vsc_colors")

local function callback()
  return {
    -- misc
    ["@comment"] = { link = "Comment" },
    ["@comment.documentation"] = { link = "@comment" },
    ['@error'] = { fg = c.vscRed, bg = c.vscNone },
    ["@none"] = { link = "@Comment" },
    ["@preproc"] = { link = "PreProc" },
    ["@define"] = { link = "Define" },
    ['@operator'] = { fg = c.vscFront, bg = c.vscNone },

    -- punctuation
    ['@punctuation.bracket'] = { fg = c.vscFront, bg = c.vscNone },
    ['@punctuation.delimiter'] = { fg = c.vscFront, bg = c.vscNone },
    ['@punctuation.special'] = { fg = c.vscFront, bg = c.vscNone },

    -- literals
    ['@string'] = { fg = c.vscOrange, bg = c.vscNone },
    ["@string.escape"] = { fg = c.vscOrange }, --
    ['@string.regex'] = { fg = c.vscOrange, bg = c.vscNone },
    ["@string.special"] = { link = "String" },

    ['@character'] = { fg = c.vscOrange, bg = c.vscNone },
    ["@character.special"] = { link = "SpecialChar" },

    ['@boolean'] = { fg = c.vscBlue, bg = c.vscNone },
    ['@number'] = { fg = c.vscLightGreen, bg = c.vscNone },
    ['@float'] = { fg = c.vscLightGreen, bg = c.vscNone },

    -- function
    ['@function'] = { fg = c.vscYellow, bg = c.vscNone },
    ['@function.builtin'] = { fg = c.vscYellow, bg = c.vscNone },
    ["@function.call"] = { link = "@function" },
    ['@function.macro'] = { fg = c.vscYellow, bg = c.vscNone },

    ['@method'] = { fg = c.vscYellow, bg = c.vscNone },
    ["@method.call"] = { link = "@method" },

    ['@constructor'] = { fg = c.vscBlueGreen, bg = c.vscNone },
    ['@parameter'] = { fg = c.vscLightBlue, bg = c.vscNone },

    -- keyword
    ['@keyword'] = { fg = c.vscPink, bg = c.vscNone },
    ["@keyword.corotine"] = { link = "Keyword" },
    ['@keyword.function'] = { fg = c.vscBlue, bg = c.vscNone },
    ['@keyword.operator'] = { fg = c.vscBlue, bg = c.vscNone },
    ["@keyword.return"] = { link = "Keyword" },
    ["@keyword.export"] = { link = "Keyword" },

    ['@conditional'] = { fg = c.vscPink, bg = c.vscNone },
    ["@conditional.ternary"] = { link = "@conditional" },

    ['@repeat'] = { fg = c.vscPink, bg = c.vscNone },
    ["@debug"] = { link = "Debug" },
    ['@label'] = { fg = c.vscLightBlue, bg = c.vscNone },
    ['@include'] = { fg = c.vscPink, bg = c.vscNone },
    ['@exception'] = { fg = c.vscPink, bg = c.vscNone },

    -- types
    ['@type'] = { fg = c.vscBlueGreen, bg = c.vscNone },
    ['@type.builtin'] = { fg = c.vscBlue, bg = c.vscNone },
    ["@type.definition"] = { link = "@type" },
    ['@type.qualifier'] = { fg = c.vscBlue, bg = c.vscNone },

    ["@storageclass"] = { link = "StorageClass" },
    ['@attribute'] = { fg = c.vscYellow, bg = c.vscNone },
    ['@field'] = { fg = c.vscLightBlue, bg = c.vscNone },
    ['@property'] = { fg = c.vscLightBlue, bg = c.vscNone },

    -- identifiers
    ['@variable'] = { fg = c.vscLightBlue, bg = c.vscNone },
    ['@variable.builtin'] = { fg = c.vscLightBlue, bg = c.vscNone },

    ['@constant'] = { fg = c.vscAccentBlue, bg = c.vscNone },
    ['@constant.builtin'] = { fg = c.vscBlue, bg = c.vscNone },
    ['@constant.macro'] = { fg = c.vscBlueGreen, bg = c.vscNone },

    ['@namespace'] = { fg = c.vscBlueGreen, bg = c.vscNone },
    ["@symbol"] = { link = "Special" },

    -- text
    ['@text'] = { fg = c.vscFront, bg = c.vscNone },
    ['@text.strong'] = { fg = c.vscBlue or c.vscViolet, bold = true },
    ['@text.emphasis'] = { fg = c.vscFront, bg = c.vscNone, italic = true },
    ['@text.underline'] = { fg = c.vscYellowOrange, bg = c.vscNone },
    ["@text.strike"] = { fg = C.green, strikethrough = true }, --
    ['@text.title'] = { fg = c.vscBlue or c.vscYellowOrange, bold = true },
    ['@text.literal'] = { fg = c.vscFront, bg = c.vscNone },
    ["@text.quote"] = { fg = C.text, italic = true }, --
    ['@text.uri'] = { fg = c.vscFront, bg = c.vscNone },
    ["@text.math"] = { fg = C.blue },
    ["@text.environment"] = { fg = C.orange },
    ["@text.environment.name"] = { fg = C.blue },
    ["@text.reference"] = { fg = C.yellow, bold = true },

    ["@text.todo"] = { fg = C.base, bg = C.yellow },
    ['@text.note'] = { fg = c.vscBlueGreen, bg = c.vscNone, bold = true },
    ["@text.todo.note"] = { link = "@text.note" },
    ['@text.warning'] = { fg = c.vscYellowOrange, bg = c.vscNone, bold = true },
    ["@text.todo.warning"] = { link = "@text.warning" },
    ['@text.danger'] = { fg = c.vscRed, bg = c.vscNone, bold = true },
    ["@text.todo.danger"] = { link = "@text.danger" },
    ["@text.unchecked"] = { fg = C.overlay1 },
    ["@text.todo.unchecked"] = { link = "@text.unchecked" },
    ["@text.checked"] = { fg = C.green },
    ["@text.todo.checked"] = { link = "@text.checked" },

    ['@text.diff.add'] = { link = 'DiffAdd' },
    ['@text.diff.delete'] = { link = 'DiffDelete' },

    -- tag
    ['@tag'] = { fg = c.vscBlue, bg = c.vscNone },
    ['@tag.attribute'] = { fg = c.vscLightBlue, bg = c.vscNone },
    ['@tag.delimiter'] = { fg = c.vscGray, bg = c.vscNone },

    -- semantic tokens
    -- NOTE: these can not be found in the documentation are are specific
    ['@annotation'] = { fg = c.vscYellow, bg = c.vscNone },
    ["@class"] = { fg = C.blue },
    ['@decorator'] = { link = 'Identifier' },
    ["@enum"] = { fg = C.cyan },
    ["@enumMember"] = { fg = C.orange },
    ['@event'] = { link = 'Identifier' },
    ['@interface'] = { link = 'Identifier' },
    ['@modifier'] = { link = 'Identifier' },
    ['@regexp'] = { fg = c.vscRed, bg = c.vscNone },
    ["@struct"] = { fg = C.blue },
    ["@typeParameter"] = { fg = C.yellow },

    -- in vsc theme
    ['@attribute.builtin'] = { fg = c.vscBlueGreen, bg = c.vscNone },
    ['@parameter.reference'] = { fg = c.vscLightBlue, bg = c.vscNone },
    ['@storageClass'] = { fg = c.vscBlue, bg = c.vscNone },
    ['@structure'] = { fg = c.vscLightBlue, bg = c.vscNone },

    ['@text.literal.markdown'] = { fg = c.vscOrange, bg = c.vscNone },
    ['@text.literal.markdown_inline'] = { fg = c.vscOrange, bg = c.vscNone },
    ['@textReference'] = { fg = c.vscOrange or c.vscYellowOrange },
    ['@stringEscape'] = { fg = c.vscOrange or c.vscYellowOrange, bold = true },

    -----------------------
    -- Language Specific --
    -----------------------

    -- cpp
    ["@property.cpp"] = { fg = C.orange },

    -- css
    ["@number.css"] = { fg = C.cyan },
    ["@property.css"] = { fg = C.orange },
    ["@property.class.css"] = { fg = C.yellow },
    ["@property.id.css"] = { fg = C.blue },
    ["@string.plain.css"] = { fg = C.green },
    ["@type.tag.css"] = { fg = C.purple },
    ["@type.css"] = { fg = C.orange },

    -- json
    ["@label.json"] = { fg = C.blue },

    -- lua
    ["@constructor.lua"] = { fg = C.orange },
    ["@variable.lua"] = { link = "@variable" },

    -- markdown
    ["@literal.markdown"] = { fg = C.green },
    ["@none.markdown"] = { fg = C.text },
    ["@punctuation.delimiter.markdown"] = { fg = C.text },
    ["@punctuation.special.markdown"] = { fg = C.red },
    ["@title.markdown"] = { fg = C.red, bold = true },

    -- PHP
    ["@type.qualifier.php"] = { link = "Keyword" },
    ["@method.php"] = { link = "Function" },
    ["@method.call.php"] = { link = "Function" },

    -- Ruby
    ["@symbol.ruby"] = { fg = C.orange },

    -- rust
    ["@constant.rust"] = { fg = C.cyan },
    ["@function.macro.rust"] = { fg = C.orange },
    ["@keyword.function.rust"] = { fg = C.orange },
    ["@namespace.rust"] = { fg = C.yellow },
    ["@type.rust"] = { fg = C.yellow },

    -- toml
    ["@property.toml"] = { fg = C.red },

    -- typescript
    ["@type.qualifier.typescript"] = { link = "Keyword" },

    -- TSX (Typescript React)
    ["@constructor.tsx"] = { fg = C.lavender },
    ["@tag.attribute.tsx"] = { fg = C.purple, italic = true },

    -- yaml
    ["@field.yaml"] = { fg = C.red },
  }
  -- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md
end

return callback
