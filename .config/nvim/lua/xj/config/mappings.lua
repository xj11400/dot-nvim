-- TODO: replace <leader> to <Leader> everywhere in XXXNvim v4 to match vimdoc
local utils = require "xj.core.utils"
local get_icon = utils.get_icon
local is_available = utils.is_available
local ui = require "xj.core.utils.ui"

local maps = require("xj.core.utils").empty_map_table()

local sections = {
  f = { desc = get_icon("Search", 1, true) .. "Find" },
  l = { desc = get_icon("ActiveLSP", 1, true) .. "LSP" },
  b = { desc = get_icon("Tab", 1, true) .. "Buffers" },
  bs = { desc = get_icon("Sort", 1, true) .. "Sort Buffers" },
  d = { desc = get_icon("Debugger", 1, true) .. "Debugger" },
  g = { desc = get_icon("Git", 1, true) .. "Git" },
  t = { desc = get_icon("Terminal", 1, true) .. "Terminal" },
}

local localsections = {
  package = { desc = get_icon("Package", 1, true) .. "Packages" },
  ui = { desc = get_icon("Window", 1, true) .. "UI/UX" },
  session = { desc = get_icon("Session", 1, true) .. "Session" },
  toggle = { desc = get_icon("Toggle", 1, true) .. "Toggle" },
  xj = {desc = "> XJ_"}
}

-- Normal --
-- Standard Operations
maps.n["j"] = { "v:count == 0 ? 'gj' : 'j'", expr = true, desc = "Move cursor down" }
maps.n["k"] = { "v:count == 0 ? 'gk' : 'k'", expr = true, desc = "Move cursor up" }
-- TODO: Remove when dropping support for <Neovim v0.10
if not vim.ui.open then maps.n["gx"] = { utils.system_open, desc = "Open the file under cursor with system app" } end

-- move
maps.n["<C-J>"] = { ":m .+1<CR>==", desc = "Move line down" }
maps.n["<C-K>"] = { ":m .-2<CR>==", desc = "Move line up" }
maps.v["<C-J>"] = { ":m '>+1<CR>gv=gv", desc = "Move line down" }
maps.v["<C-K>"] = { ":m '<-2<CR>gv=gv", desc = "Move line up" }
maps.i["<C-S-J>"] = { "<Esc>:m .+1<CR>==gi", desc = "Move line down" }
maps.i["<C-S-K>"] = { "<Esc>:m .-2<CR>==gi", desc = "Move line up" }

-- resize split
maps.n["<C-w>H"]= { "<cmd>resize -2<CR>", desc = "Resize split up" }
maps.n["<C-w>J"] = { "<cmd>resize +2<CR>", desc = "Resize split down" }
maps.n["<C-w>K"] = { "<cmd>vertical resize -2<CR>", desc = "Resize split left" }
maps.n["<C-w>L"] = { "<cmd>vertical resize +2<CR>", desc = "Resize split right" }

-- yank, paste, serch
maps.n["<leader>y"] = { "\"+y", desc = "+Copy" }
maps.n["<leader>p"] = { "\"+p", desc = "+Paste" }
maps.v["<leader>y"] = { "\"+y", desc = "+Copy" }
maps.v["<leader>p"] = { "\"+p", desc = "+Paste" }
maps.v["p"] = { "p:let @\"=@0<CR>", desc = "Paste" }
maps.v["*"] = { "y/<C-R>\"<CR>", desc = "Visual search *" }
maps.v["#"] = { "y?<C-R>\"<CR>", desc = "Visual search #" }

-- file
maps.n["<localleader>w"] = { "<cmd>w<cr>", desc = get_icon("Save", 1, true) .. "Save" }
maps.n["<localleader>q"] = { "<cmd>confirm q<cr>", desc = get_icon("PowerOff", 1, true) .. "Quit" }
maps.n["<localleader>W"] = { "<cmd>w!<cr>", desc = get_icon("ForceWrite", 1, true) .. "Force write" }
maps.n["<localleader>Q"] = { "<cmd>qa<cr>", desc = get_icon("PowerOff", 1, true) .. "Quit all" }
maps.n["<localleader>n"] = { "<cmd>enew<cr>", desc = get_icon("FileNew", 1, true) .. "New File" }

--- Insert mode
-- maps.i['<C-b>'] = { '<C-o>h', desc = 'Left' }
-- maps.i['<C-n>'] = { '<C-o>j', desc = 'Down' }
-- maps.i['<C-p>'] = { '<C-o>k', desc = 'Up' }
-- maps.i['<C-f>'] = { '<C-o>l', desc = 'Right' }
maps.i['<C-b>'] = { '<Left>', desc = 'Left' }
maps.i['<C-n>'] = { '<Down>', desc = 'Down' }
maps.i['<C-p>'] = { '<Up>', desc = 'Up' }
maps.i['<C-f>'] = { '<Right>', desc = 'Right' }
maps.i['<C-h>'] = { '<BS>', desc = 'Backspace' }
maps.i['<C-d>'] = { '<Del>', desc = 'Delete' }
maps.i['<C-j>'] = { '<CR>', desc = 'Enter' }
maps.i['<M-f>'] = { '<C-o>w', desc = 'Next word' }
maps.i['<M-b>'] = { '<C-o>b', desc = 'Prev word' }
maps.i['<C-a>'] = { '<Home>', desc = 'Home' }
maps.i['<C-e>'] = { '<End>', desc = 'End' }

--- Command line mode
maps.c['<C-d>'] = { '<Del>', desc = 'Delete' }
maps.c['<C-h>'] = { '<BS>', desc = 'Backspace' }
maps.c['<C-a>'] = { '<Home>', desc = 'Home' }
maps.c['<C-e>'] = { '<End>', desc = 'End' }
maps.c['<C-p>'] = { '<Up>', desc = 'Up' }
maps.c['<C-n>'] = { '<Down>', desc = 'Down' }
maps.c['<C-f>'] = { '<Right>', desc = 'Right' }
maps.c['<C-b>'] = { '<Left>', desc = 'Left' }

-- Plugin Manager
maps.n["<localleader>p"] = localsections.package
maps.n["<localleader>pi"] = { function() require("lazy").install() end, desc = "Plugins Install" }
maps.n["<localleader>ps"] = { function() require("lazy").home() end, desc = "Plugins Status" }
maps.n["<localleader>pS"] = { function() require("lazy").sync() end, desc = "Plugins Sync" }
maps.n["<localleader>pu"] = { function() require("lazy").check() end, desc = "Plugins Check Updates" }
maps.n["<localleader>pU"] = { function() require("lazy").update() end, desc = "Plugins Update" }
maps.n["<localleader>pa"] = { "<cmd>UpdatePackages<cr>", desc = "Update Plugins and Mason Packages" }

-- XXXNvim
-- maps.n["<localleader>pA"] = { "<cmd>XXXUpdate<cr>", desc = "XXXNvim Update" }
-- maps.n["<localleader>pv"] = { "<cmd>XXXVersion<cr>", desc = "XXXNvim Version" }
-- maps.n["<localleader>pl"] = { "<cmd>XXXChangelog<cr>", desc = "XXXNvim Changelog" }

-- Manage Buffers
maps.n["<leader>c"] = { function() require("xj.core.utils.buffer").close() end, desc = "Close buffer" }
maps.n["<leader>C"] = { function() require("xj.core.utils.buffer").close(0, true) end, desc = "Force close buffer" }
maps.n["]b"] =
{ function() require("xj.core.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" }
maps.n["[b"] = {
  function() require("xj.core.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
  desc = "Previous buffer",
}
maps.n[">b"] = {
  function() require("xj.core.utils.buffer").move(vim.v.count > 0 and vim.v.count or 1) end,
  desc = "Move buffer tab right",
}
maps.n["<b"] = {
  function() require("xj.core.utils.buffer").move(-(vim.v.count > 0 and vim.v.count or 1)) end,
  desc = "Move buffer tab left",
}

maps.n["<leader>b"] = sections.b
maps.n["<leader>bc"] =
{ function() require("xj.core.utils.buffer").close_all(true) end, desc = "Close all buffers except current" }
maps.n["<leader>bC"] = { function() require("xj.core.utils.buffer").close_all() end, desc = "Close all buffers" }
maps.n["<leader>bb"] = {
  function()
    require("xj.core.utils.status.heirline").buffer_picker(function(bufnr) vim.api.nvim_win_set_buf(0, bufnr) end)
  end,
  desc = "Select buffer from tabline",
}
maps.n["<leader>bd"] = {
  function()
    require("xj.core.utils.status.heirline").buffer_picker(
      function(bufnr) require("xj.core.utils.buffer").close(bufnr) end
    )
  end,
  desc = "Close buffer from tabline",
}
maps.n["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" }
maps.n["<leader>bD"] = {
  function()
    require("xj.core.utils.status").heirline.buffer_picker(function(bufnr) require("xj.core.utils.buffer").close(bufnr) end)
  end,
  desc = "Pick to close",
}
maps.n["<leader>bl"] =
  { function() require("xj.core.utils.buffer").close_left() end, desc = "Close all buffers to the left" }
maps.n["<leader>bp"] = { function() require("xj.core.utils.buffer").prev() end, desc = "Previous buffer" }
maps.n["<leader>br"] =
{ function() require("xj.core.utils.buffer").close_right() end, desc = "Close all buffers to the right" }
maps.n["<leader>bs"] = sections.bs
maps.n["<leader>bse"] = { function() require("xj.core.utils.buffer").sort "extension" end, desc = "By extension" }
maps.n["<leader>bsr"] =
  { function() require("xj.core.utils.buffer").sort "unique_path" end, desc = "By relative path" }
maps.n["<leader>bsp"] =
  { function() require("xj.core.utils.buffer").sort "full_path" end, desc = "By full path" }
maps.n["<leader>bsi"] =
  { function() require("xj.core.utils.buffer").sort "bufnr" end, desc = "By buffer number" }
maps.n["<leader>bsm"] =
  { function() require("xj.core.utils.buffer").sort "modified" end, desc = "By modification" }
maps.n["<leader>b-"] = {
  function()
    require("xj.core.utils.status.heirline").buffer_picker(function(bufnr)
      vim.cmd.split()
      vim.api.nvim_win_set_buf(0, bufnr)
    end)
  end,
  desc = "Horizontal split buffer from tabline",
}
maps.n["<leader>b%"] = {
  function()
    require("xj.core.utils.status.heirline").buffer_picker(function(bufnr)
      vim.cmd.vsplit()
      vim.api.nvim_win_set_buf(0, bufnr)
    end)
  end,
  desc = "Vertical split buffer from tabline",
}

-- Navigate tabs
maps.n["]t"] = { function() vim.cmd.tabnext() end, desc = "Next tab" }
maps.n["[t"] = { function() vim.cmd.tabprevious() end, desc = "Previous tab" }

-- Alpha
if is_available "alpha-nvim" then
  maps.n["<localleader>h"] = {
    function()
      local wins = vim.api.nvim_tabpage_list_wins(0)
      if #wins > 1 and vim.api.nvim_get_option_value("filetype", { win = wins[1] }) == "neo-tree" then
        vim.fn.win_gotoid(wins[2]) -- go to non-neo-tree window to toggle alpha
      end
      require("alpha").start(false, require("alpha").default_config)
    end,
    desc = get_icon("Home", 1, true) .. "Home Screen",
  }
end

-- Comment
if is_available "Comment.nvim" then
  maps.n["<leader>/"] = {
    function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
    desc = "Toggle comment line",
  }
  maps.v["<leader>/"] = {
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    desc = "Toggle comment for selection",
  }
end

-- GitSigns
if is_available "gitsigns.nvim" then
  maps.n["<leader>g"] = sections.g
  maps.n["]g"] = { function() require("gitsigns").next_hunk() end, desc = "Next Git hunk" }
  maps.n["[g"] = { function() require("gitsigns").prev_hunk() end, desc = "Previous Git hunk" }
  maps.n["<leader>gl"] = { function() require("gitsigns").blame_line() end, desc = "View Git blame" }
  maps.n["<leader>gL"] = { function() require("gitsigns").blame_line { full = true } end, desc = "View full Git blame" }
  maps.n["<leader>gp"] = { function() require("gitsigns").preview_hunk() end, desc = "Preview Git hunk" }
  maps.n["<leader>gh"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset Git hunk" }
  maps.n["<leader>gr"] = { function() require("gitsigns").reset_buffer() end, desc = "Reset Git buffer" }
  maps.n["<leader>gs"] = { function() require("gitsigns").stage_hunk() end, desc = "Stage Git hunk" }
  maps.n["<leader>gS"] = { function() require("gitsigns").stage_buffer() end, desc = "Stage Git buffer" }
  maps.n["<leader>gu"] = { function() require("gitsigns").undo_stage_hunk() end, desc = "Unstage Git hunk" }
  maps.n["<leader>gd"] = { function() require("gitsigns").diffthis() end, desc = "View Git diff" }
end

-- NeoTree
if is_available "neo-tree.nvim" then
  maps.n["<leader>E"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" }
  maps.n["<leader>ee"] = { "<cmd>Neotree position=current dir=%:p:h:h reveal_file=%:p<cr>", desc = "Toggle Explorer Current" }
  maps.n["<leader>e"] = {
    function()
      if vim.bo.filetype == "neo-tree" then
        vim.cmd.wincmd "p"
      else
        vim.cmd.Neotree "focus"
      end
    end,
    desc = "Toggle Explorer Focus",
  }
end

-- Session Manager
if is_available "neovim-session-manager" then
  maps.n["<localleader>s"] = localsections.session
  maps.n["<localleader>sl"] = { "<cmd>SessionManager! load_last_session<cr>", desc = "Load last session" }
  maps.n["<localleader>ss"] = { "<cmd>SessionManager! save_current_session<cr>", desc = "Save this session" }
  maps.n["<localleader>sd"] = { "<cmd>SessionManager! delete_session<cr>", desc = "Delete session" }
  maps.n["<localleader>sf"] = { "<cmd>SessionManager! load_session<cr>", desc = "Search sessions" }
  maps.n["<localleader>s."] =
  { "<cmd>SessionManager! load_current_dir_session<cr>", desc = "Load current directory session" }
end
if is_available "resession.nvim" then
  maps.n["<localleader>s"] = sections.S
  maps.n["<localleader>sl"] = { function() require("resession").load "Last Session" end, desc = "Load last session" }
  maps.n["<localleader>ss"] = { function() require("resession").save() end, desc = "Save this session" }
  maps.n["<localleader>st"] = { function() require("resession").save_tab() end, desc = "Save this tab's session" }
  maps.n["<localleader>sd"] = { function() require("resession").delete() end, desc = "Delete a session" }
  maps.n["<localleader>sf"] = { function() require("resession").load() end, desc = "Load a session" }
  maps.n["<localleader>s."] = {
    function() require("resession").load(vim.fn.getcwd(), { dir = "dirsession" }) end,
    desc = "Load current directory session",
  }
end

-- Package Manager
if is_available "mason.nvim" then
  maps.n["<localleader>pm"] = { "<cmd>Mason<cr>", desc = "Mason Installer" }
  maps.n["<localleader>pM"] = { "<cmd>MasonUpdateAll<cr>", desc = "Mason Update" }
end

-- Smart Splits
if is_available "smart-splits.nvim" then
  maps.n["<C-w>h"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" }
  maps.n["<C-w>j"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" }
  maps.n["<C-w>k"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" }
  maps.n["<C-w>l"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" }
  maps.n["<C-w>r"] = { function() require("smart-splits").start_resize_mode() end, desc = "Start resize mode" }
  maps.n["<C-w>x"] = { desc = "Swap Window" }
  maps.n["<C-w>xh"] = { function() require('smart-splits').swap_buf_left() end, desc = "Swap window with left"}
  maps.n["<C-w>xj"] = { function() require('smart-splits').swap_buf_down() end, desc = "Swap window with down"}
  maps.n["<C-w>xk"] = { function() require('smart-splits').swap_buf_up() end, desc = "Swap window with up"}
  maps.n["<C-w>xl"] = { function() require('smart-splits').swap_buf_right() end, desc = "Swap window with right"}
end

-- SymbolsOutline
if is_available "aerial.nvim" then
  maps.n["<leader>l"] = sections.l
  maps.n["<leader>lS"] = { function() require("aerial").toggle() end, desc = "Symbols outline" }
end

-- Telescope
if is_available "telescope.nvim" then
  maps.n["<leader>f"] = sections.f
  maps.n["<leader>g"] = sections.g
  maps.n["<leader>gb"] =
    { function() require("telescope.builtin").git_branches { use_file_path = true } end, desc = "Git branches" }
  maps.n["<leader>gc"] = {
    function() require("telescope.builtin").git_commits { use_file_path = true } end,
    desc = "Git commits (repository)",
  }
  maps.n["<leader>gC"] = {
    function() require("telescope.builtin").git_bcommits { use_file_path = true } end,
    desc = "Git commits (current file)",
  }
  maps.n["<leader>gt"] =
    { function() require("telescope.builtin").git_status { use_file_path = true } end, desc = "Git status" }
  maps.n["<leader>f<CR>"] = { function() require("telescope.builtin").resume() end, desc = "Resume previous search" }
  maps.n["<leader>f'"] = { function() require("telescope.builtin").marks() end, desc = "Find marks" }
  maps.n["<leader>f/"] =
    { function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Find words in current buffer" }
  maps.n["<leader>fa"] = {
    function()
      local cwd = vim.fn.stdpath "config" .. "/.."
      local search_dirs = {}
      for _, dir in ipairs(xj.supported_configs) do                             -- search all supported config locations
        if dir == xj.install.home then dir = dir .. "/lua/user" end             -- don't search the xj core files
        if vim.fn.isdirectory(dir) == 1 then table.insert(search_dirs, dir) end -- add directory to search if exists
      end
      if vim.tbl_isempty(search_dirs) then                                      -- if no config folders found, show warning
        utils.notify("No user configuration files found", vim.log.levels.WARN)
      else
        if #search_dirs == 1 then cwd = search_dirs[1] end -- if only one directory, focus cwd
        require("telescope.builtin").find_files {
          prompt_title = "Config Files",
          search_dirs = search_dirs,
          cwd = cwd,
        } -- call telescope
      end
    end,
    desc = "Find XXXNvim config files",
  }
  maps.n["<leader>fb"] = { function() require("telescope.builtin").buffers() end, desc = "Find buffers" }
  maps.n["<leader>fc"] = { function() require("telescope.builtin").grep_string() end, desc = "Find word under cursor" }
  maps.n["<leader>fC"] = { function() require("telescope.builtin").commands() end, desc = "Find commands" }
  maps.n["<leader>ff"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" }
  maps.n["<leader>fF"] = {
    function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
    desc = "Find all files",
  }
  maps.n["<leader>fh"] = { function() require("telescope.builtin").help_tags() end, desc = "Find help" }
  maps.n["<leader>fk"] = { function() require("telescope.builtin").keymaps() end, desc = "Find keymaps" }
  maps.n["<leader>fm"] = { function() require("telescope.builtin").man_pages() end, desc = "Find man" }
  if is_available "nvim-notify" then
    maps.n["<leader>fn"] =
    { function() require("telescope").extensions.notify.notify() end, desc = "Find notifications" }
  end
  maps.n["<leader>fo"] = { function() require("telescope.builtin").oldfiles() end, desc = "Find history" }
  maps.n["<leader>fr"] = { function() require("telescope.builtin").registers() end, desc = "Find registers" }
  maps.n["<leader>ft"] =
  { function() require("telescope.builtin").colorscheme { enable_preview = true } end, desc = "Find themes" }
  maps.n["<leader>fw"] = { function() require("telescope.builtin").live_grep() end, desc = "Find words" }
  maps.n["<leader>fW"] = {
    function()
      require("telescope.builtin").live_grep {
        additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
      }
    end,
    desc = "Find words in all files",
  }
  maps.n["<leader>l"] = sections.l
  maps.n["<leader>ls"] = {
    function()
      local aerial_avail, _ = pcall(require, "aerial")
      if aerial_avail then
        require("telescope").extensions.aerial.aerial()
      else
        require("telescope.builtin").lsp_document_symbols()
      end
    end,
    desc = "Search symbols",
  }
end

-- Terminal
if is_available "toggleterm.nvim" then
  maps.n["<leader>t"] = sections.t
  if vim.fn.executable "lazygit" == 1 then
    maps.n["<leader>g"] = sections.g
    maps.n["<leader>gg"] = {
      function()
        local worktree = require("xj.core.utils.git").file_worktree()
        local flags = worktree and (" --work-tree=%s --git-dir=%s"):format(worktree.toplevel, worktree.gitdir) or ""
        utils.toggle_term_cmd("lazygit " .. flags)
      end,
      desc = "ToggleTerm lazygit",
    }
    maps.n["<leader>tl"] = maps.n["<leader>gg"]
  end
  if vim.fn.executable "ranger" == 1 then
    maps.n["<leader>tr"] = { function() utils.toggle_term_cmd "ranger" end, desc = "ToggleTerm ranger" }
  end
  if vim.fn.executable "node" == 1 then
    maps.n["<leader>tn"] = { function() utils.toggle_term_cmd "node" end, desc = "ToggleTerm node" }
  end
  if vim.fn.executable "gdu" == 1 then
    maps.n["<leader>tu"] = { function() utils.toggle_term_cmd "gdu" end, desc = "ToggleTerm gdu" }
  end
  if vim.fn.executable "btm" == 1 then
    maps.n["<leader>tt"] = { function() utils.toggle_term_cmd "btm" end, desc = "ToggleTerm btm" }
  end
  local python = vim.fn.executable "python" == 1 and "python" or vim.fn.executable "python3" == 1 and "python3"
  if python then maps.n["<leader>tp"] = { function() utils.toggle_term_cmd(python) end, desc = "ToggleTerm python" } end
  maps.n["<leader>tf"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" }
  maps.n["<leader>th"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" }
  maps.n["<leader>tv"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" }
  maps.n["<leader>`"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
  maps.t["<leader>`"] = maps.n["<leader>`"]
  maps.t["<leader><esc>"] = { "<C-\\><C-n>", desc = "Toggle terminal visual" }
  -- maps.n["<F7>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
  -- maps.t["<F7>"] = maps.n["<F7>"]
  -- maps.n["<C-'>"] = maps.n["<F7>"] -- requires terminal that supports binding <C-'>
  -- maps.t["<C-'>"] = maps.n["<F7>"] -- requires terminal that supports binding <C-'>
end

if is_available "nvim-dap" then
  maps.n["<leader>d"] = sections.d
  maps.v["<leader>d"] = sections.d
  -- modified function keys found with `showkey -a` in the terminal to get key code
  -- run `nvim -V3log +quit` and search through the "Terminal info" in the `log` file for the correct keyname
  maps.n["<F5>"] = { function() require("dap").continue() end, desc = "Debugger: Start" }
  maps.n["<F17>"] = { function() require("dap").terminate() end, desc = "Debugger: Stop" } -- Shift+F5
  maps.n["<F21>"] = { -- Shift+F9
    function()
      vim.ui.input({ prompt = "Condition: " }, function(condition)
        if condition then require("dap").set_breakpoint(condition) end
      end)
    end,
    desc = "Debugger: Conditional Breakpoint",
  }
  maps.n["<F29>"] = { function() require("dap").restart_frame() end, desc = "Debugger: Restart" } -- Control+F5
  maps.n["<F6>"] = { function() require("dap").pause() end, desc = "Debugger: Pause" }
  maps.n["<F9>"] = { function() require("dap").toggle_breakpoint() end, desc = "Debugger: Toggle Breakpoint" }
  maps.n["<F10>"] = { function() require("dap").step_over() end, desc = "Debugger: Step Over" }
  maps.n["<F11>"] = { function() require("dap").step_into() end, desc = "Debugger: Step Into" }
  maps.n["<F23>"] = { function() require("dap").step_out() end, desc = "Debugger: Step Out" } -- Shift+F11
  maps.n["<leader>db"] = { function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint (F9)" }
  maps.n["<leader>dB"] = { function() require("dap").clear_breakpoints() end, desc = "Clear Breakpoints" }
  maps.n["<leader>dc"] = { function() require("dap").continue() end, desc = "Start/Continue (F5)" }
  maps.n["<leader>dC"] = {
    function()
      vim.ui.input({ prompt = "Condition: " }, function(condition)
        if condition then require("dap").set_breakpoint(condition) end
      end)
    end,
    desc = "Conditional Breakpoint (S-F9)",
  }
  maps.n["<leader>di"] = { function() require("dap").step_into() end, desc = "Step Into (F11)" }
  maps.n["<leader>do"] = { function() require("dap").step_over() end, desc = "Step Over (F10)" }
  maps.n["<leader>dO"] = { function() require("dap").step_out() end, desc = "Step Out (S-F11)" }
  maps.n["<leader>dq"] = { function() require("dap").close() end, desc = "Close Session" }
  maps.n["<leader>dQ"] = { function() require("dap").terminate() end, desc = "Terminate Session (S-F5)" }
  maps.n["<leader>dp"] = { function() require("dap").pause() end, desc = "Pause (F6)" }
  maps.n["<leader>dr"] = { function() require("dap").restart_frame() end, desc = "Restart (C-F5)" }
  maps.n["<leader>dR"] = { function() require("dap").repl.toggle() end, desc = "Toggle REPL" }
  maps.n["<leader>ds"] = { function() require("dap").run_to_cursor() end, desc = "Run To Cursor" }

  if is_available "nvim-dap-ui" then
    maps.n["<leader>dE"] = {
      function()
        vim.ui.input({ prompt = "Expression: " }, function(expr)
          if expr then require("dapui").eval(expr) end
        end)
      end,
      desc = "Evaluate Input",
    }
    maps.v["<leader>dE"] = { function() require("dapui").eval() end, desc = "Evaluate Input" }
    maps.n["<leader>du"] = { function() require("dapui").toggle() end, desc = "Toggle Debugger UI" }
    maps.n["<leader>dh"] = { function() require("dap.ui.widgets").hover() end, desc = "Debugger Hover" }
  end
end

-- Improved Code Folding
if is_available "nvim-ufo" then
  maps.n["zR"] = { function() require("ufo").openAllFolds() end, desc = "Open all folds" }
  maps.n["zM"] = { function() require("ufo").closeAllFolds() end, desc = "Close all folds" }
  maps.n["zr"] = { function() require("ufo").openFoldsExceptKinds() end, desc = "Fold less" }
  maps.n["zm"] = { function() require("ufo").closeFoldsWith() end, desc = "Fold more" }
  maps.n["zp"] = { function() require("ufo").peekFoldedLinesUnderCursor() end, desc = "Peek fold" }
end

-- Stay in indent mode
maps.v["<S-Tab>"] = { "<gv", desc = "Unindent line" }
maps.v["<Tab>"] = { ">gv", desc = "Indent line" }

-- Improved Terminal Navigation
maps.t["<C-w>h"] = { "<cmd>wincmd h<cr>", desc = "Terminal left window navigation" }
maps.t["<C-w>j"] = { "<cmd>wincmd j<cr>", desc = "Terminal down window navigation" }
maps.t["<C-w>k"] = { "<cmd>wincmd k<cr>", desc = "Terminal up window navigation" }
maps.t["<C-w>l"] = { "<cmd>wincmd l<cr>", desc = "Terminal right window navigation" }

maps.n["<localleader>u"] = localsections.ui
-- Custom menu for modification of the user experience
if is_available "nvim-autopairs" then maps.n["<localleader>ua"] = { ui.toggle_autopairs, desc = "Toggle autopairs" } end
maps.n["<localleader>ub"] = { ui.toggle_background, desc = "Toggle background" }
if is_available "nvim-cmp" then maps.n["<localleader>uc"] = { ui.toggle_cmp, desc = "Toggle autocompletion" } end
if is_available "nvim-colorizer.lua" then
  maps.n["<localleader>uC"] = { "<cmd>ColorizerToggle<cr>", desc = "Toggle color highlight" }
end
maps.n["<localleader>ud"] = { ui.toggle_diagnostics, desc = "Toggle diagnostics" }
maps.n["<localleader>ug"] = { ui.toggle_signcolumn, desc = "Toggle signcolumn" }
maps.n["<localleader>ui"] = { ui.set_indent, desc = "Change indent setting" }
maps.n["<localleader>ul"] = { ui.toggle_statusline, desc = "Toggle statusline" }
maps.n["<localleader>uL"] = { ui.toggle_codelens, desc = "Toggle CodeLens" }
maps.n["<localleader>un"] = { ui.change_number, desc = "Change line numbering" }
maps.n["<localleader>uN"] = { ui.toggle_ui_notifications, desc = "Toggle Notifications" }
maps.n["<localleader>up"] = { ui.toggle_paste, desc = "Toggle paste mode" }
maps.n["<localleader>us"] = { ui.toggle_spell, desc = "Toggle spellcheck" }
maps.n["<localleader>uS"] = { ui.toggle_conceal, desc = "Toggle conceal" }
maps.n["<localleader>ut"] = { ui.toggle_tabline, desc = "Toggle tabline" }
maps.n["<localleader>uu"] = { ui.toggle_url_match, desc = "Toggle URL highlight" }
maps.n["<localleader>uw"] = { ui.toggle_wrap, desc = "Toggle wrap" }
maps.n["<localleader>uy"] = { ui.toggle_syntax, desc = "Toggle syntax highlight" }
maps.n["<localleader>uh"] = { ui.toggle_foldcolumn, desc = "Toggle foldcolumn" }

-- Toggle
maps.n["<localleader>t"] = localsections.toggle
if is_available "auto-save.nvim" then
  maps.n["<localleader>ts"] = { "<cmd>ASToggle<cr>", desc = "Toggle AutoSave" }
end

-- XJ
maps.n["<localleader>x"] = localsections.xj
maps.n["<localleader>xr"] = { "<cmd>XXXReload<cr>", desc = "Reload" }

if is_available "oil.nvim" and vim.fn.executable "ranger" == 1 then
  maps.n["<localleader>xe"] = {
    function()
      local dir = xj.install.home .. "/lua"
      -- utils.toggle_term_cmd ("ranger " .. dir)
      require("oil").open_float(dir)
    end,
    desc = "Explore Config",
  }
end

if is_available "telescope.nvim" then
  maps.n["<localleader>xu"] = {
    function()
      local cwd = vim.fn.stdpath "config" .. "/.."
      local search_dirs = {}
      for _, dir in ipairs(xj.supported_configs) do -- search all supported config locations
        if dir == xj.install.home then dir = dir .. "/lua/user" end -- don't search the xj core files
        if vim.fn.isdirectory(dir) == 1 then table.insert(search_dirs, dir) end -- add directory to search if exists
      end
      if vim.tbl_isempty(search_dirs) then -- if no config folders found, show warning
        utils.notify("No user configuration files found", vim.log.levels.WARN)
      else
        if #search_dirs == 1 then cwd = search_dirs[1] end -- if only one directory, focus cwd
        require("telescope.builtin").find_files {
          prompt_title = "Config Files",
          search_dirs = search_dirs,
          cwd = cwd,
        } -- call telescope
      end
    end,
    desc = "Find user config files",
  }
  maps.n["<localleader>xc"] = {
    function()
      local cwd = vim.fn.stdpath "config" .. "/.."
      local search_dirs = {}
      for _, dir in ipairs(xj.supported_configs) do -- search all supported config locations
        if dir == xj.install.home then dir = dir .. "/lua/xj" end -- don't search the xj core files
        if vim.fn.isdirectory(dir) == 1 then table.insert(search_dirs, dir) end -- add directory to search if exists
      end
      if vim.tbl_isempty(search_dirs) then -- if no config folders found, show warning
        utils.notify("No user configuration files found", vim.log.levels.WARN)
      else
        if #search_dirs == 1 then cwd = search_dirs[1] end -- if only one directory, focus cwd
        require("telescope.builtin").find_files {
          prompt_title = "Config Files",
          search_dirs = search_dirs,
          cwd = cwd,
        } -- call telescope
      end
    end,
    desc = "Find xj config files",
  }
end

utils.set_mappings(xj.user_opts("mappings", maps))
