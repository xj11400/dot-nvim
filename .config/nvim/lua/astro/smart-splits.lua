return {
  "mrjones2014/smart-splits.nvim",
  event = "VeryLazy", -- load on very lazy for mux detection
  specs = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n["<C-w>h"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" }
        maps.n["<C-w>j"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" }
        maps.n["<C-w>k"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" }
        maps.n["<C-w>l"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" }
        maps.n["<C-w>r"] = { function() require("smart-splits").start_resize_mode() end, desc = "Start resize mode" }
        maps.n["<C-w>x"] = { desc = "Swap Window" }
        maps.n["<C-w>xh"] = { function() require("smart-splits").swap_buf_left() end, desc = "Swap window with left" }
        maps.n["<C-w>xj"] = { function() require("smart-splits").swap_buf_down() end, desc = "Swap window with down" }
        maps.n["<C-w>xk"] = { function() require("smart-splits").swap_buf_up() end, desc = "Swap window with up" }
        maps.n["<C-w>xl"] = { function() require("smart-splits").swap_buf_right() end, desc = "Swap window with right" }
      end,
    },
  },
  opts = { ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" }, ignored_buftypes = { "nofile" } },
}
