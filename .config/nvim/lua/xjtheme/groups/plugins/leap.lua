local function callback()
    return {
        LeapMatch = { fg = C.yellow, undercurl = true, bold = true },
        LeapLabelPrimary = { fg = C.overlay2, bg = C.yellow, bold = true },
        LeapLabelSecondary = { fg = C.yellow, bold = true },
        -- LeapBackdrop = { fg = C.text },
        -- LeapLabelSelected = {},
    }
end

return callback
