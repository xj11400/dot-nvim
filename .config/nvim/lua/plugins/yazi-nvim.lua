---@type LazySpec
return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<Leader>ty",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Yazi",
    },
    {
      "<Leader>tyy",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Yazi Current Directory",
    },
    {
      -- Open in the current working directory
      "<Leader>tyw",
      -- function() require("yazi").yazi(nil, vim.fn.getcwd()) end,
      "<cmd>Yazi cwd<cr>",
      desc = "Yazi Working Directory",
    },
    {
      "<Leader>-",
      "<cmd>Yazi toggle<cr>",
      desc = "Toggle Yazi",
    },
  },
  ---@type YaziConfig
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    -- open_for_directories = false,

    -- keymaps = {
    --   show_help = '<f1>',
    --   open_file_in_vertical_split = '<c-v>',
    --   open_file_in_horizontal_split = '<c-x>',
    --   open_file_in_tab = '<c-t>',
    --   grep_in_directory = '<c-s>',
    --   replace_in_directory = '<c-g>',
    --   cycle_open_buffers = '<tab>',
    --   copy_relative_path_to_selected_files = '<c-y>',
    -- },
  },
}
