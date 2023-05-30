local function callback()
  return {
    NeoTreeDirectoryIcon = { fg = C.blue },
    NeoTreeRootName = { fg = C.text, bold = true },
    NeoTreeFileName = { fg = C.text },
    NeoTreeFileIcon = { fg = C.text },
    NeoTreeFileNameOpened = { fg = C.green },
    NeoTreeIndentMarker = { fg = C.light_blue },
    NeoTreeGitAdded = { fg = C.green },
    NeoTreeGitConflict = { fg = C.red },
    NeoTreeGitModified = { fg = C.orange },
    NeoTreeGitUntracked = { fg = C.yellow },
    NeoTreeNormal = { bg = C.crust },
    NeoTreeNormalNC = { bg = C.crust },
    NeoTreeSymbolicLinkTarget = { fg = C.cyan },
    NeoTreeTabActive = { fg = C.text },
    NeoTreeTabInactive = { fg = C.subtext0, bg = C.base },
    NeoTreeTabSeparatorActive = { fg = C.base ,bg = C.base },
    NeoTreeTabSeparatorInactive = { fg = C.base, bg = C.base }
  }
end

return callback
