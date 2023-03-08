local augroup_name = 'XJNvim'
local group = vim.api.nvim_create_augroup(augroup_name, {
    clear = true
})

vim.api.nvim_create_autocmd('VimResized', {
    command = 'tabdo wincmd =',
    group = group
})

vim.cmd([[
    command! XJUpdate lua require('xj.core.xj').update()
]])
