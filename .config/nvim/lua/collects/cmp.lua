return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require "cmp"
    local map = opts.mapping
    map["<C-P>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select }
    map["<C-N>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select }
    map["<C-S-P>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }
    map["<C-S-N>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }
    map["<C-J>"] = map["<CR>"]
    map["<C-\\["] = map["<C-E>"]
  end,
}
