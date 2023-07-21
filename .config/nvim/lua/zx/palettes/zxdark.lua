local c = {
  none = "NONE",
  syntax = {},
  ui = {},
  term = {},
}

c.base = require("zx.base").base

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

c.syntax.text = "#ADB0BB"
c.syntax.comment = "#696C76"
c.syntax.mute = "#595C66"

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

c.ui.tabline = "#111317"
c.ui.winbar = "#797D87"
c.ui.tool = "#16181D"
c.ui.base = "#1A1D23"
c.ui.inactive_base = "#16181D"
c.ui.statusline = "#111317"
c.ui.split = "#111317"
c.ui.popup = "#16181D"
c.ui.float = "#16181D"
c.ui.title = c.ui.accent
c.ui.border = "#3A3E47"
c.ui.current_line = "#1E222A"
c.ui.scrollbar = c.ui.accent
c.ui.selection = "#26343F"
c.ui.menu_selection = c.ui.accent
c.ui.highlight = "#1E222A"
c.ui.none_text = "#3A3E47"
c.ui.text = "#9B9FA9"
c.ui.text_active = "#ADB0BB"
c.ui.text_inactive = "#494D56"
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
c.icon = {
  c = "#519aba",
  css = "#61afef",
  deb = "#a1b7ee",
  docker = "#384d54",
  html = "#de8c92",
  jpeg = "#c882e7",
  jpg = "#c882e7",
  js = "#ebcb8b",
  jsx = "#519ab8",
  kt = "#7bc99c",
  lock = "#c4c720",
  lua = "#51a0cf",
  mp3 = "#d39ede",
  mp4 = "#9ea3de",
  out = "#abb2bf",
  png = "#c882e7",
  py = "#a3b8ef",
  rb = "#ff75a0",
  robots = "#abb2bf",
  rpm = "#fca2aa",
  rs = "#dea584",
  toml = "#39bf39",
  ts = "#519aba",
  ttf = "#abb2bf",
  vue = "#7bc99c",
  woff = "#abb2bf",
  woff2 = "#abb2bf",
  zip = "#f9d71c",
  md = "#519aba",
  pkg = "#d39ede",
}

return c
