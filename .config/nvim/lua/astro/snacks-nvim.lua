local get_icon = require("astroui").get_icon

return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            "",
            "",
            "> XJ_",
            "",
            "",
          }, "\n"),
          keys = {
            { key = "n", action = "<Localleader>n", icon = get_icon("FileNew", 0, true), desc = "New File  " },
            { key = "r", action = "<Leader>fo", icon = get_icon("DefaultFile", 0, true), desc = "Recents  " },
            { key = "f", action = "<Leader>ff", icon = get_icon("Search", 0, true), desc = "Find File  " },
            { key = "w", action = "<Leader>fw", icon = get_icon("WordFile", 0, true), desc = "Find Word  " },
            { key = "'", action = "<Leader>f'", icon = get_icon("Bookmarks", 0, true), desc = "Bookmarks  " },
            { key = "s", action = "<Localleader>sl", icon = get_icon("Refresh", 0, true), desc = "Last Session  " },
            {
              key = ".",
              action = "<Localleader>s.",
              icon = get_icon("Refresh", 0, true),
              desc = "Current Directory Session  ",
            },
          },
        },
        sections = {
          { section = "header", padding = 5 },
          { section = "keys", gap = 1, padding = 3 },
          { section = "startup", icon = "" },
        },
      },
      picker = {
        actions = {
          change_cwd = function(picker)

            local item = picker:current()
            if not item or not item.file then return end

            -- Get the target directory: use item.file if it's a directory,
            --    otherwise get the parent directory of the file.
            local target_dir = vim.fn.isdirectory(item.file) == 1 and item.file or vim.fn.fnamemodify(item.file, ":p:h")

            -- Update Neovim's global current working directory (CWD).
            vim.api.nvim_set_current_dir(target_dir)

            -- Update the Explorer UI to reflect the new directory.
            picker:set_cwd(target_dir)

            -- notify
            require("snacks").notifier.notify("CWD changed to: " .. target_dir, "info", {
              title = "Explorer",
              icon = "󱁤 ",
            })
          end,
        },
        win = {
          input = {
            keys = {
              ["<C-J>"] = { "confirm", mode = { "n", "i" } },
            },
          },
        },
        -- hidden = true, -- Global toggle for hidden files
        exclude = { ".DS_Store" },
        sources = {
          files = {
            hidden = true,
            exclude = { ".direnv" },
          },
          explorer = {
            hidden = true,
            auto_close = true,
            tree = true,
            layout = "default",
            win = {
              list = {
                keys = {
                  ["="] = { "change_cwd", desc = "change cwd", mode = { "n", "i" } },
                },
              },
            },
          },
          grep = { hidden = true },
        },
      },
      explorer = {
        replace_netrw = true,
      },
      image = {
        enabled = true,
        doc = { enabled = true, inline = false, float = true, max_width = 80, max_height = 20 },
        math = {
          enabled = true,
        },
      },
      styles = {
        snacks_image = {
          border = "rounded",
          backdrop = false,
        },
      },
      lazygit = {
        theme = {
          activeBorderColor = { fg = "SnacksPickerTitle", bold = true },
        },
      },
    }
    return opts
  end,
  keys = {
    {
      "<Leader>fH",
      mode = { "n" },
      function() require("snacks").picker.highlights() end,
      desc = "Find highlights",
    },
    {
      "<Leader>fe",
      mode = { "n" },
      function() require("snacks").picker.explorer() end,
      desc = "Explorer",
    },
  },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        opts.autocmds.neotree_start = nil -- disable neotree on start

        -- already have autocmd to dothis when vim enter
        -- opts.autocmds.snacks_start = {
        --   {
        --     event = "BufEnter",
        --     desc = "Open Snacks Explorer on startup with directory",
        --     callback = function()
        --       local stats = vim.uv.fs_stat(vim.api.nvim_buf_get_name(0))
        --       if stats and stats.type == "directory" then
        --         -- change the current working directory
        --         vim.api.nvim_set_current_dir(vim.api.nvim_buf_get_name(0))
        --         return true
        --       end
        --     end,
        --   },
        -- }
      end,
    },
  },
}
