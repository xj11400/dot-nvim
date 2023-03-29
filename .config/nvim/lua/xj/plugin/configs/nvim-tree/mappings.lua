local map = require('xj.utility').map

map('n', '<C-n>', ':NvimTreeToggle<CR>', { desc = 'Toggle Tree' })
map('n', '<leader>nt', ':NvimTreeToggle<CR>', { desc = 'Toggle Tree' })
map('n', '<leader>nr', ':NvimTreeRefresh<CR>', { desc = 'Refresh Tree' })
