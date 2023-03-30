local map = require('xj.utility').map

map('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle Tree' })
map('n', '<leader>er', ':NvimTreeRefresh<CR>', { desc = 'Refresh Tree' })
