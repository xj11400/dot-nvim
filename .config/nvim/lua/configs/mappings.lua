--
--
--

local maps = { c = {}, i = {}, n = {}, t = {}, v = {}, x = {} }

-- move line
maps.n["<C-J>"] = { ":m .+1<CR>==", desc = "Move line down" }
maps.n["<C-K>"] = { ":m .-2<CR>==", desc = "Move line up" }
maps.v["<C-J>"] = { ":m '>+1<CR>gv=gv", desc = "Move line down" }
maps.v["<C-K>"] = { ":m '<-2<CR>gv=gv", desc = "Move line up" }
maps.i["<C-S-J>"] = { "<Esc>:m .+1<CR>==gi", desc = "Move line down" }
maps.i["<C-S-K>"] = { "<Esc>:m .-2<CR>==gi", desc = "Move line up" }

-- yank, paste, serch
maps.n["<leader>y"] = { '"+y', desc = "+Copy" }
maps.n["<leader>p"] = { '"+p', desc = "+Paste" }
maps.v["<leader>y"] = { '"+y', desc = "+Copy" }
maps.v["<leader>p"] = { '"+p', desc = "+Paste" }
maps.v["p"] = { 'p:let @"=@0<CR>', desc = "Paste" }
maps.v["*"] = { 'y/<C-R>"<CR>', desc = "Visual search *" }
maps.v["#"] = { 'y?<C-R>"<CR>', desc = "Visual search #" }

-- resize split
maps.n["<C-W>K"] = { "<cmd>resize -2<CR>", desc = "Resize split up" }
maps.n["<C-W>J"] = { "<cmd>resize +2<CR>", desc = "Resize split down" }
maps.n["<C-W>H"] = { "<cmd>vertical resize -2<CR>", desc = "Resize split left" }
maps.n["<C-W>L"] = { "<cmd>vertical resize +2<CR>", desc = "Resize split right" }

-- Improved Terminal Navigation
-- maps.t["<C-w>h"] = { "<cmd>wincmd h<cr>", desc = "Terminal left window navigation" }
-- maps.t["<C-w>j"] = { "<cmd>wincmd j<cr>", desc = "Terminal down window navigation" }
-- maps.t["<C-w>k"] = { "<cmd>wincmd k<cr>", desc = "Terminal up window navigation" }
-- maps.t["<C-w>l"] = { "<cmd>wincmd l<cr>", desc = "Terminal right window navigation" }

--- Emacs movement
-- insert mode
-- maps.i['<C-b>'] = { '<C-o>h', desc = 'Left' }
-- maps.i['<C-n>'] = { '<C-o>j', desc = 'Down' }
-- maps.i['<C-p>'] = { '<C-o>k', desc = 'Up' }
-- maps.i['<C-f>'] = { '<C-o>l', desc = 'Right' }
maps.i["<C-P>"] = { "<Up>", desc = "Up" }
maps.i["<C-N>"] = { "<Down>", desc = "Down" }
maps.i["<C-B>"] = { "<Left>", desc = "Left" }
maps.i["<C-F>"] = { "<Right>", desc = "Right" }
maps.i["<C-H>"] = { "<BS>", desc = "Backspace" }
maps.i["<C-D>"] = { "<Del>", desc = "Delete" }
maps.i["<C-J>"] = { "<CR>", desc = "Enter" }
maps.i["<C-A>"] = { "<Home>", desc = "Home" }
maps.i["<C-E>"] = { "<End>", desc = "End" }
maps.i["<M-F>"] = { "<C-o>w", desc = "Next word" }
maps.i["<M-B>"] = { "<C-o>b", desc = "Prev word" }
--- command line mode
maps.c["<C-P>"] = { "<Up>", desc = "Up" }
maps.c["<C-N>"] = { "<Down>", desc = "Down" }
maps.c["<C-B>"] = { "<Left>", desc = "Left" }
maps.c["<C-F>"] = { "<Right>", desc = "Right" }
maps.c["<C-H>"] = { "<BS>", desc = "Backspace" }
maps.c["<C-D>"] = { "<Del>", desc = "Delete" }
maps.c["<C-J>"] = { "<CR>", desc = "Enter" }
maps.c["<C-A>"] = { "<Home>", desc = "Home" }
maps.c["<C-E>"] = { "<End>", desc = "End" }
-- terminal
maps.t["<C-P>"] = { "<Up>", desc = "Up" }
maps.t["<C-N>"] = { "<Down>", desc = "Down" }
maps.t["<C-B>"] = { "<Left>", desc = "Left" }
maps.t["<C-F>"] = { "<Right>", desc = "Right" }
-- TODO: these can't work
-- maps.t['<C-H>'] = { '<BS>', desc = 'Backspace' }
-- maps.t['<C-D>'] = { '<Del>', desc = 'Delete' }
-- maps.t["<C-J>"] = { "<CR>", desc = "Enter" }
-- maps.t['<C-A>'] = { '<Home>', desc = 'Home' }
-- maps.t['<C-E>'] = { '<End>', desc = 'End' }

return maps
