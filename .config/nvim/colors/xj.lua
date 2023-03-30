-- https://github.com/chriskempson/base16/blob/main/styling.md
-- base00 - Default Background
-- base01 - Lighter Background (Used for status bars, line number and folding marks)
-- base02 - Selection Background
-- base03 - Comments, Invisibles, Line Highlighting
-- base04 - Dark Foreground (Used for status bars)
-- base05 - Default Foreground, Caret, Delimiters, Operators
-- base06 - Light Foreground (Not often used)
-- base07 - Light Background (Not often used)
-- base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
-- base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
-- base0A - Classes, Markup Bold, Search Text Background
-- base0B - Strings, Inherited Class, Markup Code, Diff Inserted
-- base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
-- base0D - Functions, Methods, Attribute IDs, Headings
-- base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
-- base0F - Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
vim.cmd('hi clear')

vim.g.colors_name = 'xj'

require('base16-colorscheme').setup({
    base00 = '#1e222a',
    base01 = '#616671',
    base02 = '#3e4451',
    base03 = '#9a9da4',
    base04 = '#565c64',
    base05 = '#d0d2d6',
    base06 = '#b6bdca',
    base07 = '#f4f7ff',
    base08 = '#ca5448',
    base09 = '#caba83',
    base0A = '#9b8a4b',
    base0B = '#799C61',
    base0C = '#2e7991',
    base0D = '#5882ca',
    base0E = '#a352a9',
    base0F = '#f6afa8'
})

-- xj.term.00 = '#616671',
-- xj.term.01 = '#ca5448',
-- xj.term.02 = '#799C61',
-- xj.term.03 = '#9b8a4b',
-- xj.term.04 = '#5882ca',
-- xj.term.05 = '#a352a9',
-- xj.term.06 = '#2e7991',
-- xj.term.07 = '#d0d2d6',
-- xj.term.08 = '#9a9da4',
-- xj.term.09 = '#f6afa8',
-- xj.term.0A = '#9BC77B',
-- xj.term.0B = '#caba83',
-- xj.term.0C = '#88b1fb',
-- xj.term.0D = '#ce9edc',
-- xj.term.0E = '#52b5d9',
-- xj.term.0F = '#f4f7ff'

-- M.base_16 = {
--     base00 = "#1e222a",
--     base02 = "#3e4451",
--     base04 = "#565c64",
--     base06 = "#b6bdca",
--     base09 = "#d19a66",
--     base0F = "#be5046",
--   }
-- vim.g.terminal_color_0 = colors.base01 "#353b45"
-- vim.g.terminal_color_1 = colors.base08 "#e06c75"
-- vim.g.terminal_color_2 = colors.base0B "#98c379"
-- vim.g.terminal_color_3 = colors.base0A "#e5c07b"
-- vim.g.terminal_color_4 = colors.base0D "#61afef"
-- vim.g.terminal_color_5 = colors.base0E "#c678dd"
-- vim.g.terminal_color_6 = colors.base0C "#56b6c2"
-- vim.g.terminal_color_7 = colors.base05 "#abb2bf"
-- vim.g.terminal_color_8 = colors.base03 "#545862"
-- vim.g.terminal_color_9 = colors.base08 "#e06c75"
-- vim.g.terminal_color_10 = colors.base0B "#98c379"
-- vim.g.terminal_color_11 = colors.base0A "#e5c07b"
-- vim.g.terminal_color_12 = colors.base0D "#61afef"
-- vim.g.terminal_color_13 = colors.base0E "#c678dd"
-- vim.g.terminal_color_14 = colors.base0C "#56b6c2"
-- vim.g.terminal_color_15 = colors.base07 "#c8ccd4"

-- let g:colors_name = 'base16-onedark'
-- lua require('base16-colorscheme').setup({
--     \ base00 = '#282c34', base01 = '#353b45', base02 = '#3e4451', base03 = '#545862',
--     \ base04 = '#565c64', base05 = '#abb2bf', base06 = '#b6bdca', base07 = '#c8ccd4',
--     \ base08 = '#e06c75', base09 = '#d19a66', base0A = '#e5c07b', base0B = '#98c379',
--     \ base0C = '#56b6c2', base0D = '#61afef', base0E = '#c678dd', base0F = '#be5046'
--     \})

-- let g:colors_name = 'base16-tokyo-night-dark'
-- lua require('base16-colorscheme').setup({
--     \ base00 = '#1a1b26', base01 = '#16161e', base02 = '#2f3549', base03 = '#444b6a',
--     \ base04 = '#787c99', base05 = '#a9b1d6', base06 = '#cbccd1', base07 = '#d5d6db',
--     \ base08 = '#c0caf5', base09 = '#a9b1d6', base0A = '#0db9d7', base0B = '#9ece6a',
--     \ base0C = '#b4f9f8', base0D = '#2ac3de', base0E = '#bb9af7', base0F = '#f7768e'
--     \})

-- hi clear
-- let g:colors_name = 'base16-nord'
-- lua require('base16-colorscheme').setup({
--     \ base00 = '#2e3440', base01 = '#3b4252', base02 = '#434c5e', base03 = '#4c566a',
--     \ base04 = '#d8dee9', base05 = '#e5e9f0', base06 = '#eceff4', base07 = '#8fbcbb',
--     \ base08 = '#bf616a', base09 = '#d08770', base0A = '#ebcb8b', base0B = '#a3be8c',
--     \ base0C = '#88c0d0', base0D = '#81a1c1', base0E = '#b48ead', base0F = '#5e81ac'
--     \})

-- hi clear
-- let g:colors_name = 'base16-colors'
-- lua require('base16-colorscheme').setup({
--     \ base00 = '#111111', base01 = '#333333', base02 = '#555555', base03 = '#777777',
--     \ base04 = '#999999', base05 = '#bbbbbb', base06 = '#dddddd', base07 = '#ffffff',
--     \ base08 = '#ff4136', base09 = '#ff851b', base0A = '#ffdc00', base0B = '#2ecc40',
--     \ base0C = '#7fdbff', base0D = '#0074d9', base0E = '#b10dc9', base0F = '#85144b'
--     \})
