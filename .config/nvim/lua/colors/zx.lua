local c = {
  none = "NONE",
  syntax = {},
  ui = {},
  term = {},
  icon = {},
}

c = vim.tbl_deep_extend("force", c, require "colors.zxplaette")

--------------------------------
--- Syntax
--------------------------------
c.syntax.red = c.base.bright_red
c.syntax.blue = c.base.bright_blue
c.syntax.green = c.base.bright_green
c.syntax.yellow = c.base.bright_yellow
c.syntax.purple = c.base.bright_magenta
c.syntax.cyan = c.base.bright_cyan
c.syntax.orange = c.base.bright_orange

c.syntax.text = c.base.fg_1
c.syntax.comment = c.base.fg_5
c.syntax.mute = c.base.fg_6

--------------------------------
--- UI
--------------------------------
c.ui.red = c.base.red
c.ui.blue = c.base.blue
c.ui.green = c.base.green
c.ui.yellow = c.base.yellow
c.ui.purple = c.base.magenta
c.ui.cyan = c.base.cyan
c.ui.orange = c.base.orange

c.ui.accent = c.base.blue

c.ui.tabline = c.base.bg_1
c.ui.winbar = c.base.fg_4
c.ui.tool = c.base.bg_2
c.ui.base = c.base.bg_0
c.ui.inactive_base = c.base.bg_2
c.ui.statusline = c.base.bg_1
c.ui.split = c.base.bg_1
c.ui.popup = c.base.bg_2
c.ui.float = c.base.bg_2
c.ui.title = c.ui.accent
c.ui.border = c.base.fg_3
c.ui.current_line = c.base.bg_3
c.ui.scrollbar = c.ui.accent
c.ui.selection = c.base.bg_4
c.ui.menu_selection = c.base.bg_3
c.ui.highlight = c.base.bg_3
c.ui.none_text = c.base.fg_3
c.ui.text = c.base.fg_0
c.ui.text_active = c.base.fg_1
c.ui.text_inactive = c.base.fg_2
c.ui.text_match = c.ui.accent

--------------------------------
--- terminal
--------------------------------
c.term.black = c.ui.tabline
c.term.bright_black = c.ui.tabline

c.term.red = c.base.red
c.term.bright_red = c.base.bright_red

c.term.green = c.base.green
c.term.bright_green = c.base.bright_green

c.term.yellow = c.base.yellow
c.term.bright_yellow = c.base.bright_yellow

c.term.blue = c.base.blue
c.term.bright_blue = c.base.bright_blue

c.term.purple = c.base.magenta
c.term.bright_purple = c.base.bright_magenta

c.term.cyan = c.base.cyan
c.term.bright_cyan = c.base.bright_cyan

c.term.white = c.ui.text
c.term.bright_white = c.ui.text_active

c.term.background = c.ui.base
c.term.foreground = c.ui.text

--------------------------------
--- Icons
--------------------------------
c.icon.c = "#519aba"
c.icon.css = "#61afef"
c.icon.deb = "#a1b7ee"
c.icon.docker = "#384d54"
c.icon.html = "#de8c92"
c.icon.jpeg = "#c882e7"
c.icon.jpg = "#c882e7"
c.icon.js = "#ebcb8b"
c.icon.jsx = "#519ab8"
c.icon.kt = "#7bc99c"
c.icon.lock = "#c4c720"
c.icon.lua = "#51a0cf"
c.icon.mp3 = "#d39ede"
c.icon.mp4 = "#9ea3de"
c.icon.out = "#abb2bf"
c.icon.png = "#c882e7"
c.icon.py = "#a3b8ef"
c.icon.rb = "#ff75a0"
c.icon.robots = "#abb2bf"
c.icon.rpm = "#fca2aa"
c.icon.rs = "#dea584"
c.icon.toml = "#39bf39"
c.icon.ts = "#519aba"
c.icon.ttf = "#abb2bf"
c.icon.vue = "#7bc99c"
c.icon.woff = "#abb2bf"
c.icon.woff2 = "#abb2bf"
c.icon.zip = "#f9d71c"
c.icon.md = "#519aba"
c.icon.pkg = "#d39ede"

--------------------------------
--- set hl
--------------------------------
function c.set_hl(highlights)
  for name, hl in pairs(highlights) do
    vim.api.nvim_set_hl(0, name, hl)
  end
end

return c
