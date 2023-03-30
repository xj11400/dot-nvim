local map = require('xj.utility').map

map('n', '<leader>nt', ':NvimTreeToggle<CR>', { desc = 'Toggle Tree' })
map('n', '<leader>nr', ':NvimTreeRefresh<CR>', { desc = 'Refresh Tree' })
