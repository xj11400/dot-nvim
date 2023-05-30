local function callback()
  return {
    WhichKey = { fg = C.text },
    WhichKeyFloat = { fg = C.fg },
    WhichKeyDesc = { fg = C.subtext1 },
    WhichKeyGroup = { fg = C.subtext0 },
  }
end

return callback
