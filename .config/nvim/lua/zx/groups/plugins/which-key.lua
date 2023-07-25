local function callback(opts)
  return {
    WhichKey = { fg = C.ui.text },
    WhichKeyFloat = { bg = opts.popup and C.ui.popup or C.ui.base },
    WhichKeyBorder = { fg = C.none },
    WhichKeySeperator = { fg = C.ui.none_text },
    WhichKeyDesc = { fg = C.ui.text_inactive },
    WhichKeyGroup = { fg = C.ui.none_text },
    WhichKeyValue = { fg = C.ui.active_text },
  }
end

return callback
