local set_highlight = require('xj.utility.theme').set_highlight

-- terminal highlights
set_highlight('FloatBorder', {
    guibg = 'None'
})

vim.cmd('hi! link FloatermBorder FloatBorder')
