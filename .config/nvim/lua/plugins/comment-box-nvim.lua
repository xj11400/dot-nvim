return {
  "LudoPinelli/comment-box.nvim",
  -- opts = {
  --   -- type of comments:
  --   --   - "line":  comment-box will always use line style comments
  --   --   - "block": comment-box will always use block style comments
  --   --   - "auto":  comment-box will use block line style comments if
  --   --              multiple lines are selected, line style comments
  --   --              otherwise
  --   comment_style = "auto",
  --   doc_width = 80, -- width of the document
  --   box_width = 60, -- width of the boxes
  --   borders = { -- symbols used to draw a box
  --     top = "─",
  --     bottom = "─",
  --     left = "│",
  --     right = "│",
  --     top_left = "╭",
  --     top_right = "╮",
  --     bottom_left = "╰",
  --     bottom_right = "╯",
  --   },
  --   line_width = 70, -- width of the lines
  --   lines = { -- symbols used to draw a line
  --     line = "─",
  --     line_start = "─",
  --     line_end = "─",
  --     title_left = "─",
  --     title_right = "─",
  --   },
  --   outer_blank_lines_above = false, -- insert a blank line above the box
  --   outer_blank_lines_below = false, -- insert a blank line below the box
  --   inner_blank_lines = false, -- insert a blank line above and below the text
  --   line_blank_line_above = false, -- insert a blank line above the line
  --   line_blank_line_below = false, -- insert a blank line below the line
  -- },
  keys = function()
    local comment_box = function(bl)
      local cb = vim.fn.input("CB[x][y]" .. bl .. "[n] (xyn/help:?): ")

      -- help
      if cb == '?' then
        print(
          "CB[x][y]".. bl .. "[n]:\n" ..
          "position           : x (l, c, r)\n" ..
          "text justification : y (l, c, r, a)\n" ..
          "style              : n (number)\n" ..
          "Choose predefined style from the catalog.")
        return
      end

      -- verify
      local x, y, style = cb:match("([lcr])([lcra])(.*)")

      if x and y then
          style = style ~= "" and tonumber(style) or nil
      else
          print("Invalid input")
          return
      end

      -- command
      vim.api.nvim_command("CB" .. x .. y .. bl .. style)
    end

    local comment_box_box = function()
      comment_box("box")
    end

    local comment_box_line = function()
      comment_box("line")
    end

    local key = "gcb"
    return {
      {
        key,
        desc = "Comment Box",
      },
      {
        key.."c",
        function() require("comment-box").catalog() end,
        mode = { "n", "v" },
        desc = "Catalog",
      },
      {
        key.."b",
        function() comment_box_box() end,
        mode = { "n", "v" },
        desc = "Box",
      },
      {
        key.."l",
        function() comment_box_line() end,
        mode = { "n", "v" },
        desc = "Line",
      },
      -- ──────────────────────────────────────────────────────────────────────
      {
        key.."B",
        desc = "Preset Box",
      },
      {
        key.."B1",
        function() require("comment-box").ccbox(18) end,
        mode = { "n", "v" },
        desc = "CC Box 18",
      },
      {
        key.."B2",
        function() require("comment-box").ccbox(20) end,
        mode = { "n", "v" },
        desc = "CC Box 20",
      },
      {
        key.."L",
        desc = "Preset Line",
      },
      {
        key.."L1",
        function() require("comment-box").llline(1) end,
        mode = { "n", "v" },
        desc = "LL Line 1",
      },
      {
        key.."L2",
        function() require("comment-box").llline(6) end,
        mode = { "n", "v" },
        desc = "LL Line 6",
      },
      {
        key.."L3",
        function() require("comment-box").llline(12) end,
        mode = { "n", "v" },
        desc = "LL Line 12",
      },
    }
    end,
}
