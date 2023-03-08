-- set up lazy.nvim to install plugins
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        '--branch=stable', -- latest stable release
        '--single-branch',
        '--depth=1',
        'https://github.com/folke/lazy.nvim.git',
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)
