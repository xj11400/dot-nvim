local map = require('xj.utility').map

-- Quickfix mappings
map('n', '<leader>ck', ':cexpr []<cr>', { desc = 'Clear list' })
map('n', '<leader>cc', ':cclose <cr>', { desc = 'Close list' })
map('n', '<leader>co', ':copen <cr>', { desc = 'Open list' })
map('n', '<leader>cf', ':cfdo %s/', { desc = 'Search & Replace' })
map('n', '<leader>cp', ':cprev<cr>zz', { desc = 'Prev Item' })
map('n', '<leader>cn', ':cnext<cr>zz', { desc = 'Next Item' })

-- buffer navigation
map('n', '<leader>bp', ':bprev<cr>', { desc = 'Prev buffer' })
map('n', '<leader>bn', ':bnext<cr>', { desc = 'Next buffer' })
map('n', '<leader>bd', ':bdelete<cr>', { desc = 'Delete buffer' })

-- tab navigation
map('n', '<leader>tp', ':tabprevious<cr>', { desc = 'Prev tab' })
map('n', '<leader>tn', ':tabnext<cr>', { desc = 'Next tab' })
map('n', '<leader>td', ':tabclose<cr>', { desc = 'Close tab' })

-- plugin management
map('n', '<localleader>pc', ':Lazy check<cr>', { desc = 'Check plugins' })
map('n', '<localleader>pu', ':Lazy update<cr>', { desc = 'Update plugins' })
map('n', '<localleader>ps', ':Lazy show<cr>', { desc = 'Show plugins' })
map('n', '<localleader>ph', ':Lazy help<cr>', { desc = 'Help' })
map('n', '<localleader>pp', ':Lazy profile<cr>', { desc = 'Profile' })
map('n', '<localleader>pl', ':Lazy logs<cr>', { desc = 'Logs' })
map('n', '<localleader>px', ':Lazy clear<cr>', { desc = 'Clear uninstalled plugins' })
map('n', '<localleader>pr', ':Lazy restore<cr>', { desc = 'Restore plugins from lockfile' })

-- resize with arrows
map('n', '<C-Up>', ':resize -2<CR>', { desc = 'Resize -2' })
map('n', '<C-Down>', ':resize +2<CR>', { desc = 'Resize +2' })
map('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Vertical Resize -2' })
map('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Vertical Resize +2' })

--- visual mode
map('v', '*', 'y/<C-R>"<CR>', { desc = 'visual search *' })
map('v', '#', 'y?<C-R>"<CR>', { desc = 'visual search #' })
map('n', '<C-n>', ':noh<CR>', { desc = 'no heighlight' })

--- command line mode
map('c', '<C-a>', '<Home>', { desc = 'Home' })
map('c', '<C-e>', '<End>', { desc = 'End' })
map('c', '<C-p>', '<Up>', { desc = 'Up' })
map('c', '<C-n>', '<Down>', { desc = 'Down' })

--- insert mode
map('i', '<C-b>', '<C-o>h', { desc = 'left' })
map('i', '<C-n>', '<C-o>j', { desc = 'down' })
map('i', '<C-p>', '<C-o>k', { desc = 'up' })
map('i', '<C-f>', '<C-o>l', { desc = 'right' })
map('i', '<C-h>', '<BS>', { desc = 'backspace' })
map('i', '<C-d>', '<Del>', { desc = 'delete' })
map('i', '<C-j>', '<CR>', { desc = 'enter' })
map('i', '<M-f>', '<C-o>w', { desc = 'next word' })
map('i', '<M-b>', '<C-o>b', { desc = 'prev word' })
map('i', '<C-a>', '<Home>', { desc = 'home' })
map('i', '<C-e>', '<End>', { desc = 'end' })

-- alternative mapping for paste
map('x', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = 'paste', silent = true })

-- system clipboard
map('n', '<leader>y', '"+y')
map('n', '<leader>p', '"+p')
map('v', '<leader>y', '"+y')
map('v', '<leader>p', '"+p')
